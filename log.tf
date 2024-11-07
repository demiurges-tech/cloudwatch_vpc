resource "aws_flow_log" "vpc_log" {
  iam_role_arn             = data.aws_iam_role.arn_log_iam.arn
  log_destination_type     = "cloud-watch-logs"
  log_destination          = aws_cloudwatch_log_group.log_group.arn
  traffic_type             = "ALL"
  vpc_id                   = aws_vpc.vpc.id
  max_aggregation_interval = "60"
}

resource "aws_cloudwatch_log_group" "log_group" {
  name = "Group${var.nbgroup}_VpcLogs"
}

resource "aws_sns_topic" "sns_topic" {
  name         = "Group${var.nbgroup}-Alarms-Ping-Deny"
  display_name = "Group${var.nbgroup}-Alarms-Ping-Deny"
}

resource "aws_sns_topic_subscription" "sns_subscription" {
  protocol  = "email"
  endpoint  = var.mail_alert
  topic_arn = aws_sns_topic.sns_topic.arn
}
