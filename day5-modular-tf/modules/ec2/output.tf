output "target_group_arn" {
  description = "The ARN of the Target Group created in EC2 modules"
  value = aws_lb_target_group.tg-ect.arn
}
