output "orders_table_arn" {
  value = module.orders_table.table_arn
}

output "billing_table_arn" {
  value = module.billing_table.table_arn
}

output "notifications_table_arn" {
  value = module.notifications_table.table_arn
}
