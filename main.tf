terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.69.1"
    }
  }
}

provider "aws" {
  region = "ap-south-2"
}

#1.vpc
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "terraform-vpc"
  }
}

#2.public subnet
resource "aws_subnet" "public-aws_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "terraform-public-subnet"
  }

}
#3. internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terraform-igw"
  }
}

#4. route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "terraform-public_route_table"
  }
}

# route table assosiation
resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public-aws_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

#5. security group

resource "aws_security_group" "security_group" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "terraform_security_group"
  }
  
  
  ingress {
    description = "HTTP"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }


   ingress {
    description = "SSH"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }


  ingress {
    description = "HTTPS"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }
   
  
}

# EC2
resource "aws_instance" "aws_instance-EC2" {
  ami           = "ami-0199ac7c9fbf9ed83"
  instance_type = "t3.micro"

  subnet_id = aws_subnet.public-aws_subnet.id
  security_groups = [aws_security_group.security_group.id]

  tags = {
    Name = "terraform-ec2"
  }
}




output "vpc" {
    value = aws_vpc.main.id
  
}
