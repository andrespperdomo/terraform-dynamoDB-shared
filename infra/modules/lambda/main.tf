resource "aws_iam_role" "lambda_role" {
  name = "${var.service_name}-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      Effect = "Allow"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_basic" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "this" {
  function_name = var.function_name
  handler       = var.handler
  runtime       = var.runtime
  role          = aws_iam_role.lambda_role.arn
  filename      = abspath(var.zip_file) 

  environment {
    variables = var.environment
  }

  lifecycle {
    ignore_changes = [role] # for LocalStack
  }
}