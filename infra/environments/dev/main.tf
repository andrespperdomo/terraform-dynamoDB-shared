module "orders_table" {

  source = "../../modules/dynamodb"

  table_name   = "orders-table"
  hash_key     = "orderId"
  service_name = "order-service"
  environment  = "dev"

}

module "billing_table" {

  source = "../../modules/dynamodb"

  table_name   = "billing-table"
  hash_key     = "paymentId"
  service_name = "billing-service"
  environment  = "dev"

}

module "notifications_table" {

  source = "../../modules/dynamodb"

  table_name   = "notifications-table"
  hash_key     = "notificationId"
  service_name = "notification-service"
  environment  = "dev"

}
