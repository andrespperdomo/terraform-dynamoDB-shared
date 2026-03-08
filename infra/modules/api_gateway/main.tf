#resource "aws_api_gateway_rest_api" "api" {
#  name = var.api_name
#}
#
#resource "aws_api_gateway_resource" "resource" {
#  rest_api_id = aws_api_gateway_rest_api.api.id
#  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
#  path_part   = var.path_part
#}

#resource "aws_api_gateway_method" "method" {
#  rest_api_id   = aws_api_gateway_rest_api.api.id
#  resource_id   = aws_api_gateway_resource.resource.id
#  http_method   = "POST"
#  authorization = "NONE"
#}

#resource "aws_api_gateway_integration" "lambda" {
#  rest_api_id = aws_api_gateway_rest_api.api.id
#  resource_id = aws_api_gateway_resource.resource.id
#  http_method = aws_api_gateway_method.method.http_method

#  integration_http_method = "POST"
#  type                    = "AWS_PROXY"
#  uri                     = var.lambda_invoke_arn
#}

#resource "aws_lambda_permission" "apigw" {
#  statement_id  = "AllowApiGatewayInvoke"
#  action        = "lambda:InvokeFunction"
#  function_name = var.lambda_name
#  principal     = "apigateway.amazonaws.com"
#}

# Deployment
#resource "aws_api_gateway_deployment" "deployment" {
#  depends_on = [
#    aws_api_gateway_integration.lambda
#  ]

#  rest_api_id = aws_api_gateway_rest_api.api.id
#}

# Stage (NEW REQUIRED RESOURCE)
#resource "aws_api_gateway_stage" "stage" {
#  stage_name    = "dev"
#  rest_api_id   = aws_api_gateway_rest_api.api.id
#  deployment_id = aws_api_gateway_deployment.deployment.id
#}