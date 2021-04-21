resource "aws_subnet" "primary" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.main.id
    availability_zone = data.aws_availability_zones.available.names[0]
    map_public_ip_on_launch = true
    
    tags = {
        Name = "${data.aws_availability_zones.available.names[0]} subnet"
    }
}

resource "aws_subnet" "secondary" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.main.id
    availability_zone = data.aws_availability_zones.available.names[1]
    map_public_ip_on_launch = true

    tags = {
        Name = "${data.aws_availability_zones.available.names[1]} subnet"
    }
}