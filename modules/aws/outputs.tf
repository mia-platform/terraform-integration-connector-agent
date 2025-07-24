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

output "cloudtrail_arn" {
  description = "The ARN of the CloudTrail trail."
  value       = aws_cloudtrail.trail.arn
}

output "cloudtrail_id" {
  description = "The ID of the CloudTrail trail."
  value       = aws_cloudtrail.trail.id
}

output "cloudtrail_bucket_arn" {
  description = "The ARN of the S3 bucket used by CloudTrail."
  value       = local.cloudtrail_bucket_arn
}

output "cloudtrail_bucket_id" {
  description = "The ID of the S3 bucket used by CloudTrail."
  value       = local.cloudtrail_bucket_id
}

output "sqs_queue_arn" {
  description = "The ARN of the SQS queue."
  value       = local.sqs_queue_arn
}
