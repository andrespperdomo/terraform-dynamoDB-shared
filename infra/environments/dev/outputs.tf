output "orders_table_arn" {
  value = module.orders_table.table_arn
}

output "billing_table_arn" {
  value = module.billing_table.table_arn
}

output "notifications_table_arn" {
  value = module.notifications_table.table_arn
}
# infra/environments/dev/outputs.tf
output "queue_url" {
  value = module.notifications_queue.queue_url
}

output "queue_arn" {
  value = module.notifications_queue.queue_arn
}

output "topic_arn" {
  value = module.notifications_topic.topic_arn
}