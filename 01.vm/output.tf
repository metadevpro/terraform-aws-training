output "instance_public_ip" {
  value = aws_instance.machine01.public_ip
}
output "instance_ami" {
  value = aws_instance.machine01.ami
}


output "instance_id" {
  value = aws_instance.machine01.id
}
