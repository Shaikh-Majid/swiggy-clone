module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"
  name = "single-instance"
  ami=var.ami
  instance_type=var.instance_type
  
}

/*resource "aws_security_group" "allow_tls" {
  name        = "My_SG"
  description = "My_SG"
  vpc_id      = "vpc-0ac5628517f540d97"

  ingress {
    description      = "My_SG"
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
   cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
} */

resource "aws_security_group" "mysg" {
  // Add your configuration here
}
