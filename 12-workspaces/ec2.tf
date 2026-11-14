resource "aws_instance" "worspaces_demo" {
  instance_type = lookup(var.instance_type, terraform.workspace)
  ami = data.aws_ami.joindevops.id
  vpc_security_group_ids = [aws_security_group.worspaces_demo.id]

  tags = var.ec2-tags
}

resource "aws_security_group" "worspaces_demo" {
  name        = "roboshop-worspaces-demo- ${terraform.workspace}"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port       = var.from_port
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = var.cidr
  }
  
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "roboshop-worspaces-demo- ${terraform.workspace}"
  }

  
  lifecycle {
    create_before_destroy = true
  }
}
