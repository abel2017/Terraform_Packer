resource "aws_instance" "instancia" {
    ami = "${var.AMI_ID}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.red_publica_A.id}"
    vpc_security_group_ids = ["${aws_security_group.sg.id}"]
    key_name = "${aws_key_pair.clave.key_name}"
    tags = {
        Name = "Terraform_Packer_EC2"
    }

}

resource "aws_key_pair" "clave" {
    key_name = "clave"
    public_key = "${file("terraform_public_key.pub")}"
}