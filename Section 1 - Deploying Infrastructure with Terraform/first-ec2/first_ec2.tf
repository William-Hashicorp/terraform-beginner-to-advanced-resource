provider "aws" {
  region     = "us-east-1"
  #access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  #secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


# resource <type> <resource name>
resource "aws_instance" "williamyang-myec2" {
   #ami different for each region
   ami = data.aws_ami.ubuntu.id
   instance_type = "t2.micro"
    tags = {
    Name = "william-myec2"
  }

}
