resource "random_id" "id" {
  byte_length = 1
}

module "key_pairs" {
  source = "../modules/aws/key_pairs"

  key_name = "webserver"
  filename = "./webserver.pem"
}

module "webserver" {
  source = "../modules/aws/ec2"

  user_data              = "./user-data.txt"
  vpc_security_group_ids = module.sg.security_groups_id
  key_name               = module.key_pairs.key_name

  tags                   = { "Name" : "Demo-${terraform.workspace}-${random_id.id.dec}", "Env" : terraform.workspace }

  attach_second_disk     = lookup(local.env, terraform.workspace, " ") == coalesce(terraform.workspace) ? true : false
  ebs_volume_type        = "gp3"
  ebs_volume_size        = lookup(var.ebs_volume_size, terraform.workspace, null)
  ebs_device_name        = "/dev/sdb"
}

module "sg" {
  source = "../modules/aws/security_groups"

  name        = "Webserver_SG"
  description = "Webserver Security Groups"

  rules = {
    ssh = {
      "type" : "ingress"
      "from_port" : 22
      "to_port" : 22
      "protocol" : "tcp"
      "cidr_blocks" : [local.my_ip]
    },
    http = {
      "type" : "ingress"
      "from_port" : 80
      "to_port" : 80
      "protocol" : "tcp"
      "cidr_blocks" : ["0.0.0.0/0"]
    },
    egress = {
      "type" : "egress"
      "from_port" : 0
      "to_port" : 0
      "protocol" : "-1"
      "cidr_blocks" : ["0.0.0.0/0"]
    }
  }
}
