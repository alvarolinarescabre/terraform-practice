resource "random_id" "id" {
	  byte_length = 1
}

module "cice_key_pairs" {
  source = "../modules/aws/key_pairs"

  key_name = "cice-key"
  filename = "${file("./cice-key.pem")}"
}

module "cice_instance" {
  source = "../modules/aws/ec2"

  availability_zone      = "eu-west-1a"
  user_data              = "./user-data.txt"
  vpc_security_group_ids = module.cice_sg.id
  key_name               = module.cice_key_pairs.key_name
  tags                   = { "Name" : "CICE-Demo-${terraform.workspace}-${random_id.id.dec}", "Env" : terraform.workspace }

  attach_second_disk     = lookup(local.env, terraform.workspace, " ") == coalesce(terraform.workspace) ? true : false
  ebs_volume_type        = "gp3"
  ebs_volume_size        = lookup(var.ebs_volume_size, terraform.workspace, null)
  ebs_device_name        = "/dev/sdb"
}

module "cice_sg" {
  source = "../modules/aws/security_group"

  name        = "CICE Instance Security Group - ${terraform.workspace}"
  description = "CICE Instance Security Group - ${terraform.workspace}"
  tags        = { "Name" : "CICE-Demo", "Env" : terraform.workspace }

  rules = {
    ssh = {
      "type" : "ingress"
      "from_port" : 22
      "to_port" : 22
      "protocol" : "tcp"
      "cidr_blocks" : ["0.0.0.0/0"]
    },
    http = {
      "type" : "ingress"
      "from_port" : 80
      "to_port" : 80
      "protocol" : "tcp"
      "cidr_blocks" : ["0.0.0.0/0"]
    }
    egress = {
      "type" : "egress"
      "from_port" : 0
      "to_port" : 0
      "protocol" : "-1"
      "cidr_blocks" : ["0.0.0.0/0"]
    }
  }
}
