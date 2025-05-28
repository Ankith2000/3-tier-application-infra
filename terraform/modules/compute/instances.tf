resource "aws_instance" "bastian-server" {
    ami = "ami-084568db4383264d4"
    instance_type = "t2.micro"

    associate_public_ip_address = true
    security_groups = [var.compute-workolads.bastian-server.sg-id]
    subnet_id = var.compute-workolads.bastian-server.subnet_id
    key_name = aws_key_pair.ssh-public-key-name.key_name
}