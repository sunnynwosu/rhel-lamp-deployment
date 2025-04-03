output "instance_ips" {
    value = aws_instance.rhel_instance[*].public_ip 
}