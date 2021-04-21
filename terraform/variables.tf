variable "project_name" {
    description = "Project Name"
    type = string
    default = "Rama"
}

variable "region" {
    description = "AWS Region"
    type = string
    default = "us-east-1"
}

variable "web_ami" {
    description = "AMI for Web instances"
    type = string
    default = "ami-042e8287309f5df03"
}

variable "web_instance_type" {
    description = "Instance type for Web instances"
    type = string
    default = "t3.micro"
}

variable "key_pair" {
    description = "Key pair for SSH"
    type = string
}

variable "web_hostname" {
    description = "Hostname for Web instances"
    type = string
    default = "alation-web"
}

variable "load_balancer_ami" {
    description = "AMI for Load Balancer instance"
    type = string
    default = "ami-042e8287309f5df03"
}

variable "load_balancer_instance_type" {
    description = "Instance type for Load Balancer instance"
    type = string
    default = "t3.micro"
}

variable "load_balancer_hostname" {
    description = "Hostname for Load Balancer instance"
    type = string
    default = "alation-lb"
}