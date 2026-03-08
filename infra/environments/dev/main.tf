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

module "notifications_topic" {
  source       = "../../modules/sns"
  topic_name   = "notifications-topic"
  service_name = "notification-service"
  environment  = "dev"
}

module "notifications_queue" {
  source       = "../../modules/sqs"
  queue_name   = "notifications-queue"
  topic_arn    = module.notifications_topic.topic_arn
  service_name = "notification-service"
  environment  = "dev"
}

# <-- THIS WAS MISSING OR PATH WAS WRONG -->
module "shared_lambda" {
  source        = "../../modules/lambda"
  function_name = "shared-function"
  service_name  = "shared"
  handler       = "handler.lambda_handler"
  zip_file      = "${path.root}/../../modules/lambda/shared_function.zip"
}
output "zip_path_test" {
  value = "${path.root}/lambda/shared_function.zip"
}
module "s3_bucket" {
  source = "../../modules/s3"

  bucket_name = "my-dev-bucket"
  environment = "dev"
}

#module "api_gateway" {
#  source = "../../modules/api_gateway"
#  api_name = "shared-api"
#  path_part = "process"
#  lambda_name       = module.shared_lambda.lambda_name
#  lambda_invoke_arn = module.shared_lambda.lambda_arn
#}

resource "aws_sqs_queue" "orders_queue" {
  name = "orders-queue"
}

#module "eventbridge_orders" {
#  source = "../../modules/eventbridge"
#  bus_name     = "orders-bus"
#  rule_name    = "orders-created-rule"
#  event_source = "orders.service"
#  target_arn   = aws_sqs_queue.orders_queue.arn
#}
