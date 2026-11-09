resource "aws_instance" "roboshop" {
  #count = 10
  count = length(var.instances)
  ami=  "ami-0055977a6e828a4f4"
  instance_type = "t3.micro"
  vpc_security_group_ids = [
    aws_security_group.common.id
    ]

  tags = {
    Name = "${var.project}- ${var.environment}-${var.instances[count.index]}"
  }
}

resource "aws_security_group" "common" {
  name        = "${var.project}- ${var.environment}-common"
  description = "Allow TLS inbound traffic and all outbound traffic"

  
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}- ${var.environment}-common"
  }
}


resource "aws_security_group" "roboshop" {
  #count = 10
  count = length(var.instances)
  name        = "${var.project}- ${var.environment}-${var.instances[count.index]}"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}- ${var.environment}-${var.instances[count.index]}"
  }
}