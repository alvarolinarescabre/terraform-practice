resource "aws_instance" "basic-instance" {
	ami 		= "ami-c90195b0"
	instance_type 	= "t2.micro"
}
