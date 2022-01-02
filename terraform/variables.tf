variable "mackerel_api_key" {
  type = string
}

variable "aws_integration_role_arn" {
  type = string
}

variable "aws_integration_external_id" {
  type = string
}

variable "aws_region" {
  type    = string
  default = "ap-northeast-1"
}