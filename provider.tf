provider "aws" {
  region = "ap-south-1"
}
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["${var.owner_name}"]

  filter {
    name   = "name"
    values = ["${var.image_name}"]
  }
  filter {
    name   = "root-device-type"
    values = ["${var.root_volume_type}"]
  }
  filter {
    name   = "virtualization-type"
    values = ["${var.virtualization_type}"]
  }
}
