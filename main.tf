//defining data block

data "aws_ami" "amazon-linux-3" { # we are reading aws_ami reource and naming it as amazon-linux-3
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}



resource "aws_instance" "dev_instance" {
  ami           = data.aws_ami.amazon-linux-3.id # <block name>.<resource name>.<common name>.id
  instance_type = var.instance_size
  count         = var.instance_count
  key_name      = var.instance_key

  tags = {
    Name        = "My Dev Server"
    Environment = "Dev"
  }
}