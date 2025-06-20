resource "aws_launch_template" "app_lt" {
  name_prefix   = "app-lt-"
  image_id      = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "your-key"
  user_data     = filebase64("../scripts/deploy.sh")
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
}

resource "aws_autoscaling_group" "app_asg" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier  = [aws_subnet.private.id]
  target_group_arns    = [aws_lb_target_group.app_tg.arn]
  health_check_type    = "ELB"
  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "app-instance"
    propagate_at_launch = true
  }
}
