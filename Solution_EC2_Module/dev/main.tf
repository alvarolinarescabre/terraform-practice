resource "random_id" "id" {
	  byte_length = 1
}

module "key_pairs" {
  source = "../modules/aws/key_pairs"

  key_name = "my-key"
  filename = "${file("./my-key.pem")}"
}

module "instance" {
  source = "../modules/aws/ec2"

  availability_zone      = "eu-west-1a"
  user_data              = "./user-data.txt"
  vpc_security_group_ids = module.sg.id
  key_name               = module.key_pairs.key_name
  tags                   = { "Name" : "Demo-${terraform.workspace}-${random_id.id.dec}", "Env" : terraform.workspace }

  attach_second_disk     = lookup(local.env, terraform.workspace, " ") == coalesce(terraform.workspace) ? true : false
  ebs_volume_type        = "gp3"
  ebs_volume_size        = lookup(var.ebs_volume_size, terraform.workspace, null)
  ebs_device_name        = "/dev/sdb"
}

module "sg" {
  source = "../modules/aws/security_group"

  name        = "Instance Security Group - ${terraform.workspace}"
  description = "Instance Security Group - ${terraform.workspace}"
  tags        = { "Name" : "CICE-Demo", "Env" : terraform.workspace }

  rules = {
    ssh = {
      "type" : "ingress"
      "from_port" : 22
      "to_port" : 22
      "protocol" : "tcp"
      "cidr_blocks" : [my_ip]
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
