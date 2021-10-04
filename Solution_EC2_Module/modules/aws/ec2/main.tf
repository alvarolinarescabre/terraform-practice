resource "aws_instance" "this" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  user_data              = file(var.user_data)
  vpc_security_group_ids = [var.vpc_security_group_ids]
  key_name               = var.key_name

  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
    encrypted   = var.encrypted
  }

  tags = var.tags
}

resource "aws_ebs_volume" "this" {
  count             = var.attach_second_disk ? 1 : 0
  availability_zone = aws_instance.this.availability_zone
  type              = var.ebs_volume_type
  size              = var.ebs_volume_size
  encrypted         = var.ebs_volume_encrypted

  tags = var.ebs_volume_tags
}

resource "aws_volume_attachment" "this" {
  count       = var.attach_second_disk ? 1 : 0
  device_name = var.ebs_device_name
  volume_id   = aws_ebs_volume.this[count.index].id
  instance_id = aws_instance.this.id
}