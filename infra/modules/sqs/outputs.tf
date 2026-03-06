output "queue_url" {
  value = aws_sqs_queue.my_queue.id
}

output "queue_arn" {
  value = aws_sqs_queue.my_queue.arn
}