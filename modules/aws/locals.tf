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

locals {
  cloudtrail_arn        = "arn:${data.aws_partition.current.partition}:cloudtrail:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}:trail/${var.cloudtrail_name}"
  cloudtrail_bucket_arn = var.create_s3_bucket ? aws_s3_bucket.trail_bucket[0].arn : data.aws_s3_bucket.trail_bucket[0].arn
  cloudtrail_bucket_id  = var.create_s3_bucket ? aws_s3_bucket.trail_bucket[0].id : data.aws_s3_bucket.trail_bucket[0].id

  sqs_queue_arn = var.create_sqs_queue ? aws_sqs_queue.queue[0].arn : data.aws_sqs_queue.queue[0].arn
  sqs_queue_id  = var.create_sqs_queue ? aws_sqs_queue.queue[0].id : data.aws_sqs_queue.queue[0].id
}
