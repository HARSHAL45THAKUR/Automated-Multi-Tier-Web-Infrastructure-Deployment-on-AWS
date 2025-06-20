resource "aws_acm_certificate" "cert" {
  domain_name       = "your-domain.com"
  validation_method = "DNS"
}
