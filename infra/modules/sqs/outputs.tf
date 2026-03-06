output "queue_url" {
  value = aws_sqs_queue.notifications_queue.id
}

output "queue_arn" {
  value = aws_sqs_queue.notifications_queue.arn
}