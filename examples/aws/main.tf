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

module "cloudtrail" {
  source = "github.com/mia-platform/terraform-integration-connector-agent//modules/aws"

  cloudtrail_name        = "example-resource-export"
  cloudtrail_bucket_name = "example-resource-export"
  eventbdrige_rule_name  = "example-resource-export"
  sqs_queue_name         = "example-resource-export"

  resource_to_export = [
    "aws.s3",
    "aws.lambda",
  ]
}

resource "aws_iam_user" "export_user" {
  name = "example-resource-export"
}

resource "aws_iam_user_policy" "export_user_policy" {
  name   = "ExampleResourceExportPolicy"
  user   = aws_iam_user.export_user.name
  policy = data.aws_iam_policy_document.export_user_policy.json
}

data "aws_iam_policy_document" "export_user_policy" {
  statement {
    sid    = "AllowSQSAccess"
    effect = "Allow"

    actions = [
      "sqs:ReceiveMessage",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
    ]

    resources = [
      module.cloudtrail.sqs_queue_arn,
    ]
  }

  statement {
    sid    = "AllowS3ReadAccess"
    effect = "Allow"

    actions = [
      "s3:Get*",
      "s3:List*",
      "s3:Describe*",
      "s3-object-lambda:Get*",
      "s3-object-lambda:List*"
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "AllowLambdaReadAccess"
    effect = "Allow"

    actions = [
      "lambda:Get*",
      "lambda:List*",
      "states:DescribeStateMachine",
      "states:ListStateMachines",
      "tag:GetResources",
    ]

    resources = [
      "*",
    ]
  }
}
