resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 1024
}

resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = tls_private_key.this.public_key_openssh
}

resource "local_file" "this" {
  filename        = var.filename
  file_permission = var.file_permission
  content         = tls_private_key.this.private_key_pem
}
