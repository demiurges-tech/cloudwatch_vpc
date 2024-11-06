resource "aws_flow_log" "vpc_log" {
  iam_role_arn             = data.aws_iam_role.arn_log_iam.arn
  log_destination_type     = "cloud-watch-logs"
  log_destination	   = aws_cloudwatch_log_group.vpc_log.arn
  traffic_type             = "ALL"
  vpc_id                   = aws_vpc.vpc.id
  max_aggregation_interval = "60"
}

resource "aws_cloudwatch_log_group" "vpc_log" {
  name = "Group${var.nbgroup}_VpcLogs"
}
