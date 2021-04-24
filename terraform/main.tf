########################
# PROVIDER
########################

provider "aws" {
    region = var.region
}

########################
# AWS VPC
########################

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "${var.project_name} VPC"
    }
}

########################
# EC2 Instances
########################

resource "aws_instance" "web_1" {
    ami = var.web_ami
    instance_type = var.web_instance_type
    key_name      = var.key_pair
    subnet_id = aws_subnet.primary.id
    vpc_security_group_ids = [
        aws_security_group.web_sg.id
    ]

    user_data = <<-EOF
		#! /bin/bash
        sudo hostnamectl set-hostname ${var.web_hostname}-1
	    EOF
    
    tags = {
        Name = "Web Instance 1"
    }
}

resource "aws_instance" "web_2" {
    ami = var.web_ami
    instance_type = var.web_instance_type
    key_name      = var.key_pair
    subnet_id = aws_subnet.secondary.id
    vpc_security_group_ids = [
        aws_security_group.web_sg.id
    ]
    
    user_data = <<-EOF
		#! /bin/bash
        sudo hostnamectl set-hostname ${var.web_hostname}-2
	    EOF

    tags = {
        Name = "Web Instance 2"
    }
}

resource "aws_instance" "load_balancer" {
    ami = var.load_balancer_ami
    instance_type = var.load_balancer_instance_type
    key_name      = var.key_pair
    subnet_id = aws_subnet.primary.id
    vpc_security_group_ids = [
        aws_security_group.load_balancer_sg.id
    ]
    
    user_data = <<-EOF
		#! /bin/bash
        sudo hostnamectl set-hostname ${var.load_balancer_hostname}
	    EOF

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${var.key_pair}.pem")
      host        = self.public_ip
    }


    #####################
    # Setup Ansible service on HAProxy server
    #####################
    provisioner "remote-exec" {
        scripts = ["ansible-setup.sh"]
    }

    #####################
    # Copy Ansible playbooks to remote
    #####################
    provisioner "file" {
        source = "../ansible"
        destination = "/home/ubuntu/alation"
    }

    #####################
    # Run Ansible playbook on HAProxy server
    #####################
    provisioner "remote-exec" {
        scripts = ["ansible-run.sh"]
    }

    tags = {
        Name = "Load Balancer Instance"
    }
}

