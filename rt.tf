resource "aws_route_table" "rt_public" {
    vpc_id = "${aws_vpc.vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"
    }
    tags = {
        Name = "Terraform_rt_public"
    }
}
resource "aws_route_table_association" "rt_association_public" {
    subnet_id = "${aws_subnet.red_publica_A.id}"
    route_table_id = "${aws_route_table.rt_public.id}"
}