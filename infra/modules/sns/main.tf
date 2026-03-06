resource "aws_sns_topic" "my_topic" {
  name = var.topic_name
  tags = {
    Environment = var.environment
    Service     = var.service_name
  }
}
