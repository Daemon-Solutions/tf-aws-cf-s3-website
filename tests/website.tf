module "website" {
  source              = "../"
  aliases             = ["www.trynotto.click", "www.stage.trynotto.click"]
  acm_certificate_arn = "${aws_acm_certificate_validation.cert.certificate_arn}"
  tags                = "${var.website_tags}"
  logging_bucket      = "${aws_s3_bucket.cloudfront_logs.bucket_domain_name}"
  logging_prefix      = "website"
  s3_bucket_name      = "trynottoclick-website"

  cors_rule = [
    {
      allowed_headers = ["Authorization"]
      allowed_methods = ["GET", "HEAD"]
      allowed_origins = ["*"]
      max_age_seconds = 3000
    },
  ]

  route53_alias_records = [
    {
      name    = "www.trynotto.click"
      zone_id = "ZW7HC3OXIT5P9"
    },
    {
      name    = "www.stage.trynotto.click"
      zone_id = "Z1WC5KVDZ1Z3J6"
    },
  ]
}
