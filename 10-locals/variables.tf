variable "ami_id" {
    type = string
    default = "ami-0055977a6e828a4f4"
    description = "description"
}

# variable "instance_type" {
#     type = string
#     default = "t3.micro"
#     description = "instance type"
# }

variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

# variable "ec2-tags" {
#     default = {
#        # Name = "${var.project}-${var.environment}"
#        Name = "roboshop-dev"
#     }
# }

variable "cidr" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "from_port" {
    type = number
    default = 0
}