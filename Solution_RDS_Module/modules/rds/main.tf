resource "aws_db_instance" "default" {
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  identifier             = var.identifier
  name                   = var.db_name
  username               = var.username
  password               = var.password
  parameter_group_name   = var.parameter_group_name
  skip_final_snapshot    = var.skip_final_snapshot
  apply_immediately      = var.apply_immediately
  publicly_accessible    = var.publicly_accessible
  vpc_security_group_ids = [aws_security_group.default-sg.id]
}

resource "aws_security_group" "default-sg" {
  name        = var.sg_name
  description = var.sg_description

  tags = {
    Name = var.sg_tag
  }
}

resource "aws_security_group_rule" "default-sg-rule-ingress" {
  type              = "ingress"
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  cidr_blocks       = var.cidr_blocks
  security_group_id = aws_security_group.default-sg.id
}

resource "aws_security_group_rule" "default-sg-rule-egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default-sg.id
}
 