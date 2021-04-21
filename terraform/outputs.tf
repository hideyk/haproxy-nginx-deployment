output "web_1_ip" {
  value = aws_instance.web_1.public_ip
}

output "web_2_ip" {
  value = aws_instance.web_2.public_ip
}

output "load_balancer_ip" {
  value = aws_instance.load_balancer.public_ip
}