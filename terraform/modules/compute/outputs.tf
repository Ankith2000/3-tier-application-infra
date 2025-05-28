output "frontend-lb-dns" {
  value = aws_lb.frontend-lb.dns_name
}

output "bastion-server-public-ip" {
  value = aws_instance.bastion-server.public_ip
}