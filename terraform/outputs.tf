output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}

output "app_url" {
  value = "http://${aws_lb.app_alb.dns_name}"
}
