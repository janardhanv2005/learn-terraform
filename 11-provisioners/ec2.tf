resource "aws_instance" "web" {
  ami=  "ami-0055977a6e828a4f4"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.web.id]

    provisioner "local-exec" {
         command = "echo  ${self.private_ip} > inventory.ini"
    }

    provisioner "local-exec" {
         command = "echo  Instance created..."
    }

    provisioner "local-exec" {
         when = destroy
         command = "echo instance is going to be deleted..."
    }

    # Resource-level connection block
  connection {
    type        = "ssh"
    user        = "ec2-user"
    password = "DevOps321"
    host        = self.public_ip
  }

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo dnf install nginx -y",
  #     "sudo systemctl start nginx",
  #     "sudo systemctl enable nginx"
  #   ]
  # }

  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh",
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo systemctl stop nginx"
    ]
  }

  tags = {
    Name = "roboshop-web"
  }


}

resource "aws_security_group" "web" {
  name        = "web"
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
    Name = "roboshop-web"
  }
}
