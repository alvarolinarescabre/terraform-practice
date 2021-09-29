resource "aws_security_group" "cice-sg" {
  name        = "CICE Terraform Security Group"
  description = "CICE Terraform Security Group"

  tags = {
    Name = "CICE Terraform Security Group"
  }
}

resource "aws_security_group_rule" "cice-sg-mysql" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
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
 