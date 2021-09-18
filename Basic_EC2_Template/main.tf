resource "aws_instance" "cice-instance" {
	ami 		= "ami-c90195b0"
	instance_type 	= "t2.micro"
}
