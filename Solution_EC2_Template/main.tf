resource "tls_private_key" "cice-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "cice_pem" {
  filename        = "${path.module}/cice-key.pem"
  file_permission = "0400"
  content         = tls_private_key.cice-key.private_key_pem
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.cice-key.public_key_openssh
}

resource "aws_instance" "cice-instance" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.cice-sg.id]
  key_name               = aws_key_pair.generated_key.key_name

  user_data = <<-EOF
	        #!/bin/bash
		sudo yum update
		sudo yum -y install httpd -y
		sudo service enable start
		sudo service httpd start
		echo "<h1>Hello world from EC2 $(hostname -f)</h1>" > /var/www/html/index.html
	      EOF
  tags = {
    Name = "CICE-Terraform"
  }
}

resource "aws_security_group" "cice-sg" {
  name        = "CICE Terraform Security Group"
  description = "CICE Terraform Security Group"

  tags = {
    Name = "CICE Terraform Security Group"
  }
}

resource "aws_security_group_rule" "cice-sg-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cice-sg.id
}

resource "aws_security_group_rule" "cice-sg-http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cice-sg.id
}

resource "aws_security_group_rule" "cice-sg-egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cice-sg.id
}

