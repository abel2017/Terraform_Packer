resource "aws_subnet" "red_publica_A" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "192.168.1.0/24"
    map_public_ip_on_launch = true
    tags = {
        Name = "Terraform_subnet_public_A"
    }
}
