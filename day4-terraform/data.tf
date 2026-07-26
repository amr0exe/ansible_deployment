# data sources - fetching

# key - pair
data "aws_key_pair" "web" {
  key_name = var.key_name
}

# ubuntu24.04 option_id
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

# default vpc
data "aws_vpc" "default" {
  default = true
}

# vpc -> subnets
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# acm cert
data "aws_acm_certificate" "web" {
  domain      = var.domain
  statuses    = ["ISSUED"]
  most_recent = true
}

# route 53 hosted zone
data "aws_route53_zone" "web" {
  name         = var.domain
  private_zone = false
}
