# commonly used variables
variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type    = string
  default = "ec-test"
}

variable "domain" {
  type    = string
  default = "demo.amritthapa183.com.np"
}

locals {
  project = "rem"
}
