resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "/aws/ec2/app"
  retention_in_days = 7
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "HighCPUUtilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "This metric monitors EC2 CPU utilization"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.app_asg.name
  }
  alarm_actions = []
}
