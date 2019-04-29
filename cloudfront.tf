resource "random_string" "cloudfront_user_agent" {
  count   = "${var.enabled ? 1 : 0}"
  length  = 16
  special = false
}

resource "aws_cloudfront_distribution" "website" {
  count = "${var.enabled ? 1 : 0}"

  lifecycle {
    create_before_destroy = true
  }

  aliases             = "${var.aliases}"
  comment             = "${var.comment}"
  default_root_object = "${var.default_root_object}"
  enabled             = true
  is_ipv6_enabled     = true
  price_class         = "${var.price_class}"
  retain_on_delete    = false

  # Due to the way the AWS APIs handles the call for the aws_s3_bucket.resource_name.website_endpoint call,
  # it needs to be defined as a custom origin.
  # References:
  #   https://github.com/terraform-providers/terraform-provider-aws/issues/4757
  #   https://github.com/terraform-providers/terraform-provider-aws/pull/5947/files
  origin {
    origin_id   = "${aws_s3_bucket.website.id}"
    domain_name = "${aws_s3_bucket.website.website_endpoint}"

    custom_origin_config {
      http_port              = "80"
      https_port             = "443"
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }

    custom_header {
      name  = "User-Agent"
      value = "${random_string.cloudfront_user_agent.result}"
    }
  }

  default_cache_behavior {
    allowed_methods  = ["${var.allowed_methods}"]
    cached_methods   = ["${var.cached_methods}"]
    target_origin_id = "${aws_s3_bucket.website.id}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    compress               = true
    smooth_streaming       = "${var.smooth_streaming}"
    viewer_protocol_policy = "${var.viewer_protocol_policy}"
    min_ttl                = "${var.min_ttl}"
    default_ttl            = "${var.default_ttl}"
    max_ttl                = "${var.max_ttl}"
  }

  web_acl_id = "${var.web_acl_id}"

  restrictions {
    geo_restriction {
      restriction_type = "${var.geo_restriction_type}"
      locations        = "${var.geo_restriction_locations}"
    }
  }

  tags = "${var.tags}"

  logging_config {
    bucket          = "${var.logging_bucket}"
    include_cookies = "${var.logging_include_cookies}"
    prefix          = "${var.logging_prefix}"
  }

  viewer_certificate {
    acm_certificate_arn            = "${var.acm_certificate_arn}"
    cloudfront_default_certificate = false
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "${var.minimum_ssl_protocol_version}"
  }
}
