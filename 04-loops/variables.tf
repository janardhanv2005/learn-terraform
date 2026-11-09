variable "environment" {
    default = "dev"
}

variable "project" {
    default = "roboshop"
}


variable "instances" {
    type = list
    default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]
}

variable "zone_id" {
    default = "Z02530452RT4OFPBQ4L27"
}

variable "domain_name" {
    default = "mithul.space"
}