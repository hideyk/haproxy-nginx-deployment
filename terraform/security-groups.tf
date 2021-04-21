resource "aws_security_group" "web_sg" {
    name = "web_security_group"
    description = "Allow HAProxy Access"

    ingress {
        description      = "HAProxy port"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = [aws_vpc.main.cidr_block]
    }

    egress {
        description      = "HAProxy port"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = [aws_vpc.main.cidr_block]
    }

    tags = {
        Name = "Web Security Group"
    }
}

resource "aws_security_group" "load_balancer_sg" {
    ingress {
        description      = "HTTP default port"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        description      = "HTTPS default port"
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        description      = "Nginx default port"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = [aws_vpc.main.cidr_block]
    }

    tags = {
        Name = "Load Balancer Security Group"
    }
}
