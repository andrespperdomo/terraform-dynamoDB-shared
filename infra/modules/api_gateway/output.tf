#output "api_url" {
#  value = "http://localhost:4566/restapis/${aws_api_gateway_rest_api.api.id}/${aws_api_gateway_stage.stage.stage_name}/#_user_request_/${var.path_part}"
#}