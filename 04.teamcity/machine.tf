resource "aws_instance" "machine01" {
  ami                         = "ami-089ea1de61e0c9c18"
  instance_type               = "t3.medium" # medium = 4Gb, small = 2Gb, micro = 1Gb, nano= 0.5Gb   
  associate_public_ip_address = true
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.sg_acme.id]

  root_block_device {
    volume_size = 20 #20 Gb
  }

  tags = {
    Name        = "${var.author}.teamcity"
    Author      = var.author
    Date        = "2024.02.14"
    Environment = "LAB"
    Location    = "Zaragoza"
    Project     = "acme"
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.key_path)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y docker httpd-tools",
      "sudo usermod -a -G docker ec2-user",
      "sudo curl -L https://github.com/docker/compose/releases/download/1.22.0-rc2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose",
      "sudo chmod +x /usr/local/bin/docker-compose",
      "sudo chkconfig docker on",
      "sudo service docker start",
      "sudo docker run --name portainer -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer-ce",
      "mkdir /home/ec2-user/buildagent",
    ]
  }

  provisioner "file" {
    source      = "docker-compose.yml"
    destination = "/home/ec2-user/docker-compose.yml"
  }
  provisioner "file" {
    source      = "buildagent/Dockerfile"
    destination = "/home/ec2-user/buildagent/Dockerfile"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo /usr/local/bin/docker-compose up -d",
      "free"
    ]
  }
}
