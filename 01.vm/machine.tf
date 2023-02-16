resource "aws_instance" "machine01" {
  ami                         = "ami-089ea1de61e0c9c18" //, "ami-007fae589fdf6e955" // "ami-2757f631"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.sg_acme.id]

  root_block_device {
    volume_size = 20 #20 Gb
  }

  tags = {
    Name        = "${var.author}.machine01"
    Author      = var.author
    Date        = "2021.03.17"
    Environment = "LAB"
    Location    = "Paris"
    Project     = "Acme"
  }
}
