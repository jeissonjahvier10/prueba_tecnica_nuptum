resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "/aws-infra-test/app"
  retention_in_days = 7
}
