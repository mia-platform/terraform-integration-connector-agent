# Copyright Mia srl
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_partition" "current" {}

resource "aws_cloudtrail" "trail" {
  depends_on = [aws_s3_bucket_policy.cloudtrail_bucket_policy]

  name           = var.cloudtrail_name
  s3_bucket_name = var.cloudtrail_bucket_name

  include_global_service_events = true
  is_multi_region_trail         = true

  advanced_event_selector {
    name = null
    field_selector {
      field  = "resources.type"
      equals = ["AWS::S3::Object"]
    }
    field_selector {
      field  = "eventCategory"
      equals = ["Data"]
    }
  }

  advanced_event_selector {
    name = "Management events selector"
    field_selector {
      field  = "eventCategory"
      equals = ["Management"]
    }
    field_selector {
      equals = ["false"]
      field  = "readOnly"
    }
  }

  tags = var.tags
}

resource "aws_s3_bucket" "trail_bucket" {
  count = var.create_s3_bucket ? 1 : 0

  bucket        = var.cloudtrail_bucket_name
  force_destroy = false

  tags = var.tags
}

data "aws_s3_bucket" "trail_bucket" {
  count  = var.create_s3_bucket ? 0 : 1
  bucket = var.cloudtrail_bucket_name
}

data "aws_iam_policy_document" "cloudtrail_bucket_policy" {
  statement {
    sid    = "CloudTrailAclCheck"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions   = ["s3:GetBucketAcl"]
    resources = [local.cloudtrail_bucket_arn]
    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values   = [local.cloudtrail_arn]
    }
  }

  statement {
    sid    = "CloudTrailWrite"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions   = ["s3:PutObject"]
    resources = ["${local.cloudtrail_bucket_arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values   = [local.cloudtrail_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "cloudtrail_bucket_policy" {
  bucket = local.cloudtrail_bucket_id
  policy = data.aws_iam_policy_document.cloudtrail_bucket_policy.json
}
