resource "aws_instance" "mogodb" {
  ami =  var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.mogodb.id]

  tags = var.ec2-tags
}

resource "aws_security_group" "mogodb" {
  name        = "mogodb"
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
    Name = "roboshop-mogodb"
  }

  
  lifecycle {
    create_before_destroy = true
  }
}
