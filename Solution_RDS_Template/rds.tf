resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  identifier           = "my-db"
  name                 = "bbdd_demo"
  username             = "root"
  password             = "Abc123***"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  apply_immediately    = true
  publicly_accessible  = true
  vpc_security_group_ids = [aws_security_group.cice-sg.id]
}
