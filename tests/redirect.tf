module "redirect" {
  source = "../"

  domain_names        = ["trynotto.click"]
  redirect_to         = "https://www.trynotto.click"
  redirect            = true
  acm_certificate_arn = "${aws_acm_certificate_validation.cert.certificate_arn}"
  tags                = "${var.website_redirect_tags}"
  logging_bucket      = "${aws_s3_bucket.cloudfront_logs.bucket_domain_name}"
  logging_prefix      = "redirect"
  s3_bucket_name      = "trynottoclick-redirect"
}

resource "aws_route53_record" "redirection_dns" {
  zone_id = "ZW7HC3OXIT5P9"
  name    = "trynotto.click"
  type    = "A"

  alias {
    name                   = "${module.redirect.cf_domain_name}"
    zone_id                = "${module.redirect.cf_hosted_zone_id}"
    evaluate_target_health = true
  }
}
