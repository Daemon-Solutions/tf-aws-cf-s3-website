module "website" {
  source = "../"

  domain_names        = ["www.trynotto.click"]
  acm_certificate_arn = "${aws_acm_certificate_validation.cert.certificate_arn}"
  tags                = "${var.website_tags}"
  logging_bucket      = "${aws_s3_bucket.cloudfront_logs.bucket_domain_name}"
  logging_prefix      = "website"
  s3_bucket_name      = "trynottoclick-website"
}

resource "aws_route53_record" "website_dns" {
  zone_id = "ZW7HC3OXIT5P9"
  name    = "www.trynotto.click"
  type    = "A"

  alias {
    name                   = "${module.website.cf_domain_name}"
    zone_id                = "${module.website.cf_hosted_zone_id}"
    evaluate_target_health = true
  }
}
