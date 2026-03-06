resource "aws_sns_topic" "this" {
  name = var.topic_name
  tags = {
    Environment = var.environment
    Service     = var.service_name
  }
}