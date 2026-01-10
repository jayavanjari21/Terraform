output "public_ip" {
  value = [
for key in aws_instance.my_ec2 : key.public_ip
]
}

output "public_dns" {
  value = [
for key in aws_instance.my_ec2 : key.public_dns
]
}

output "private_ip" {
  value = [
for key in aws_instance.my_ec2 : key.private_ip
]
}
