//defining data block

data "aws_ami" "amazon_linux_2023" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Amazon official
}


resource "aws_instance" "dev_instance" {
  ami           = data.aws_ami.amazon_linux_2023.id # <block name>.<resource name>.<common name>.id
  instance_type = var.instance_size
  count         = var.instance_count
  key_name      = var.instance_key

  tags = {
    Name        = "My Dev Server"
    Environment = "Dev"
  }
}

# resource "aws_vpc" "aws_vpc_example" {
#   cidr_block = "10.0.0.0/16"
# }