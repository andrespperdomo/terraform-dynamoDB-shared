#resource "aws_cloudwatch_event_bus" "this" {
#  name = var.bus_name
#}

#resource "aws_cloudwatch_event_rule" "this" {
#  name           = var.rule_name
#  event_bus_name = aws_cloudwatch_event_bus.this.name

#  event_pattern = jsonencode({
#    source = [var.event_source]
#  })
#}

#resource "aws_cloudwatch_event_target" "sqs_target" {
#  rule           = aws_cloudwatch_event_rule.this.name
#  event_bus_name = aws_cloudwatch_event_bus.this.name
#  target_id      = "SendToSQS"
#  arn            = var.target_arn
#}