#output "publicip" {
 # value = aws_instance.my_instance.public_ip
#}

output "publicip" {
  value = [for instance in aws_instance.my_instance : instance.public_ip]
}