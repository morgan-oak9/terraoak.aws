
resource "aws_acm_certificate" "sac_acm_cert" {
  domain_name       = "testingdomain.com"
  validation_method = "DNS"
}

resource "aws_acm_certificate_validation" "sac_cert_validator" {
  # oak9: Define asset inventory tags
  certificate_arn         = aws_acm_certificate.sac_acm_cert.arn
}