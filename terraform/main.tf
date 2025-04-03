provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "allow_access" {
  name = "allow_ssh_http"
  description = "Allow SSH and HTTP inbound traffic"

ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

egress {
  from_port = 0
  to_port = 0
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
}

resource "aws_instance" "rhel_instance" {
    count = 2
    ami = var.rhel-ami
    instance_type = var.instance_type
    key_name = var.key_name
    security_groups = [aws_security_group.allow_access.name]

    tags = {
      Name = "rhel-instance -${count.index +1}"
    }
}

