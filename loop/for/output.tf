output "public_ip" {
    value = {for server, instance in aws_instance.my_instance:server=> instance.public_ip}
  
}
