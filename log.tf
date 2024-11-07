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

resource "aws_cloudwatch_log_metric_filter" "metric_filter" {
  name           = "Group${var.nbgroup}-Log-Metric"
  log_group_name = aws_cloudwatch_log_group.log_group.name
  pattern        = "[version, account, eni, source, destination, srcport, destport, protocol=\"1\", packets, bytes, starttime, endtime, action=\"REJECT\", flowlogstatus]"
  metric_transformation {
    name      = "Ping Deny"
    namespace = "Group${var.nbgroup}-Ping-Deny-Metric"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "ping_deny_alarm" {
  alarm_name          = "Group${var.nbgroup}-Ping-Deny-Alarm"
  alarm_description   = "Alert when there are denied ping requests in VPC Flow Logs"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.metric_filter.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.metric_filter.metric_transformation[0].namespace
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"

  alarm_actions = [aws_sns_topic.sns_topic.arn]
}

