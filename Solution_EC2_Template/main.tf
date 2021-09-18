resource "aws_instance" "cice-instance" {
	ami 		= data.aws_ami.amazon_linux.id
	instance_type 	= "t2.micro"

	tags = {
		Name = "CICE-Terraform"
	}
}
