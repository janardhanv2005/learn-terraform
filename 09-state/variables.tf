variable "ami_id" {
    type = string
    default = "ami-0055977a6e828a4f4"
    description = "description"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "instance type"
}

variable "ec2-tags" {

    type = map
    default = {
        Name = "roboshop-mongodb"
        Environment = "dev"
        Terraform = "true"
        Project = "roboshop"
        Component = "mongodb"
    }
}

variable "cidr" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "from_port" {
    type = number
    default = 0
}