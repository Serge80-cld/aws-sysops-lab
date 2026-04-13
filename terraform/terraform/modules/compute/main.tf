###############################
# Launch Template
###############################
resource "aws_launch_template" "app" {
  name_prefix   = "${var.project_name}-${var.environment}-lt"
  image_id      = "ami-0c02fb55956c7d316" # Amazon Linux 2
  instance_type = "t3.micro"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name        = "${var.project_name}-${var.environment}-instance"
      Environment = var.environment
    }
  }
}

###############################
# Target Group
###############################
resource "aws_lb_target_group" "tg" {
  name     = "${var.project_name}-${var.environment}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

###############################
# Load Balancer
###############################
resource "aws_lb" "alb" {
  name               = "${var.project_name}-${var.environment}-alb"
  load_balancer_type = "application"
  subnets            = var.public_subnets

  tags = {
    Name = "${var.project_name}-${var.environment}-alb"
  }
}

###############################
# Listener
###############################
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

###############################
# Auto Scaling Group
###############################
resource "aws_autoscaling_group" "asg" {
  name                      = "${var.project_name}-${var.environment}-asg"
  max_size                  = 2
  min_size                  = 1
  desired_capacity          = 1
  vpc_zone_identifier       = var.private_subnets
  health_check_type         = "EC2"
  health_check_grace_period = 30

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.tg.arn]
}
