variable "function_name" {}
variable "service_name" {}
variable "handler" {}
variable "runtime" {
  default = "python3.11"
}
variable "zip_file" {}
# Optional environment variables
variable "environment" {
  type        = map(string)
  default     = {}  # default empty map if nothing is passed
  description = "Environment variables to pass to the Lambda function"
}