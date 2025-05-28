resource "aws_autoscaling_group" "frontend-autosclaing-group" {
  vpc_zone_identifier = var.compute-workloads.frontend-instances.subnets_id
  max_size = 4
  min_size = 1
  desired_capacity = 2

  launch_template {
    id = aws_launch_template.frontend-launch-template.id
    version = aws_launch_template.frontend-launch-template.latest_version
  }

  target_group_arns = [aws_lb_target_group.frontend-load-balancer-tg.arn]
}


resource "aws_autoscaling_group" "backend-autosclaing-group" {
  vpc_zone_identifier = var.compute-workloads.backend-instances.subnets_id
  max_size = 4
  min_size = 1
  desired_capacity = 2

  launch_template {
    id = aws_launch_template.backend-launch-template.id
    version = aws_launch_template.backend-launch-template.latest_version
  }

  target_group_arns = [aws_lb_target_group.backend-load-balancer-tg.arn]
}