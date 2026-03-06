resource "aws_sqs_queue" "this" {
  name = var.queue_name
  tags = {
    Environment = var.environment
    Service     = var.service_name
  }
}

resource "aws_sns_topic_subscription" "this" {
  topic_arn = var.topic_arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.this.arn

  # Needed to allow SNS to send messages to SQS
  raw_message_delivery = true
}