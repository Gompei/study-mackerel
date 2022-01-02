resource "mackerel_aws_integration" "aws_integration" {
  name          = "study-aws-integration"
  memo          = "study resource"
  role_arn      = var.aws_integration_role_arn
  external_id   = var.aws_integration_external_id
  region        = var.aws_region
  included_tags = "Name:staging,Environment:staging"
  excluded_tags = "Name:develop,Environment:develop"

  ec2 {
    enable               = true
    excluded_metrics     = []
    retire_automatically = true
  }
}
