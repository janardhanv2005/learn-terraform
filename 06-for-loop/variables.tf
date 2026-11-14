variable "environment" {
    default = "dev"
}

variable "project" {
    default = "roboshop"
}


variable "instances" {
    type = map
    default = {
        mongodb = {
            instance_type = "t3.micro"
            port_no = 27017
        },
        redis = {
            instance_type = "t3.micro"
            port_no = 6379
        }
        mysql = {
            instance_type = "t3.micro"
            port_no = "3306"
        },
        rabbitmq = {
            instance_type = "t3.micro"
            port_no = "5672"
        },
        catalogue = {
            instance_type = "t3.micro"
            port_no = "8080"
        },
        user = {
            instance_type = "t3.micro"
            port_no = "8080"
        },
        cart = {
            instance_type = "t3.micro"
            port_no = "8080"
        },
        shipping = {
            instance_type = "t3.micro"
            port_no = "8080"
        },
        payment = {
            instance_type = "t3.micro"
            port_no = "8080"
        },
        frontend = {
            instance_type = "t3.micro"
            port_no = "80"
        }
    }
       # ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]
}

variable "zone_id" {
    default = "Z02530452RT4OFPBQ4L27"
}

variable "domain_name" {
    default = "mithul.space"
}