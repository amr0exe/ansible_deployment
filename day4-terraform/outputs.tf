output "public_ip" {
  value       = [for instance in aws_instance.web : instance.public_ip]
  description = "ec2_address"
}
