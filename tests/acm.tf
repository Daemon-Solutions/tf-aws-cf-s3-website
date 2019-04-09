provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1" # US East (N. Virginia)
}

resource "aws_acm_certificate" "cert" {
  domain_name = "www.trynotto.click"

  subject_alternative_names = [
    "www.stage.trynotto.click",
  ]

  validation_method = "DNS"
  provider          = "aws.us-east-1"
}

resource "aws_route53_record" "cert_dns_validation_record_base" {
  name    = "${aws_acm_certificate.cert.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.cert.domain_validation_options.0.resource_record_type}"
  ttl     = 60
  zone_id = "ZW7HC3OXIT5P9"

  records = [
    "${aws_acm_certificate.cert.domain_validation_options.0.resource_record_value}",
  ]
}

resource "aws_route53_record" "cert_dns_validation_record_alternate" {
  name    = "${aws_acm_certificate.cert.domain_validation_options.1.resource_record_name}"
  type    = "${aws_acm_certificate.cert.domain_validation_options.1.resource_record_type}"
  ttl     = 60
  zone_id = "Z3BT5WSADCX44L"

  records = [
    "${aws_acm_certificate.cert.domain_validation_options.1.resource_record_value}",
  ]
}

resource "aws_acm_certificate_validation" "cert" {
  certificate_arn = "${aws_acm_certificate.cert.arn}"

  validation_record_fqdns = [
    "${aws_route53_record.cert_dns_validation_record_base.fqdn}",
    "${aws_route53_record.cert_dns_validation_record_alternate.fqdn}",
  ]

  provider = "aws.us-east-1"

  timeouts {
    create = "30m"
  }
}
