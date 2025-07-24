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

data "aws_cloudwatch_event_bus" "default" {
  name = "default"
}

resource "aws_cloudwatch_event_rule" "cloudtrail_rule" {
  name = var.eventbdrige_rule_name

  event_pattern = jsonencode({
    source = var.resource_to_export
  })

  tags = var.tags
}

resource "aws_cloudwatch_event_target" "sqs" {
  rule = aws_cloudwatch_event_rule.cloudtrail_rule.name
  arn  = local.sqs_queue_arn
}

resource "aws_sqs_queue" "queue" {
  count = var.create_sqs_queue ? 1 : 0
  name  = var.sqs_queue_name

  delay_seconds    = 0
  max_message_size = 262144

  message_retention_seconds  = 345600
  receive_wait_time_seconds  = 10
  visibility_timeout_seconds = 43200

  tags = var.tags
}

data "aws_sqs_queue" "queue" {
  count = var.create_sqs_queue ? 0 : 1
  name  = var.sqs_queue_name
}

data "aws_iam_policy_document" "sqs_queue_policy" {
  statement {
    sid    = "EventBridgeSendSQSMessage"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    actions   = ["sqs:SendMessage"]
    resources = [local.sqs_queue_arn]
  }
}

resource "aws_sqs_queue_policy" "sqs_policy" {
  queue_url = local.sqs_queue_id
  policy    = data.aws_iam_policy_document.sqs_queue_policy.json
}
