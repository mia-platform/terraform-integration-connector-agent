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

variable "cloudtrail_name" {
  description = "The name of the CloudTrail trail."
  type        = string
  default     = "mia-platform-resource-export"
}

variable "cloudtrail_bucket_name" {
  description = "The name of the S3 bucket where CloudTrail logs will be stored."
  type        = string
}

variable "create_s3_bucket" {
  description = "Flag to create an S3 bucket for CloudTrail logs."
  type        = bool
  default     = true
}

variable "eventbdrige_rule_name" {
  description = "The name of the EventBridge rule."
  type        = string
}

variable "resource_to_export" {
  description = "The AWS resource type to export events for."
  type        = list(string)
  default = [
    "aws.s3",
    "aws.ec2",
    "aws.rds",
    "aws.lambda",
  ]
}

variable "sqs_queue_name" {
  description = "The name of the SQS associated with the event bridge."
  type        = string
}

variable "create_sqs_queue" {
  description = "Flag to create an SQS queue for the event bridge."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
