resource "aws_instance" "basic-instance" {
	ami 		= "ami-05432c5a0f7b1bfd0"
	instance_type 	= "t2.micro"
}
