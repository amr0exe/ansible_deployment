# ec2 instance
resource "aws_instance" "web" {
  count                  = 2
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = data.aws_key_pair.web.key_name
  vpc_security_group_ids = [aws_security_group.web.id]
  tags                   = { Name = "${local.project}-web-${count.index + 1}" }
}
