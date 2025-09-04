provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0360c520857e3138f"
  instance_type          = "t2.medium"
  key_name               = "Aws"
  vpc_security_group_ids = ["sg-07ccb3cd9c9e3fa65"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
