locals {
  s3_config = {
    redirect = [{
      redirect_all_requests_to = "${var.redirect_to}"
    }]

    website = [{
      index_document = "${var.default_root_object}"
      error_document = "${var.error_document}"
      routing_rules  = "${var.routing_rules}"
    }]
  }
}

data "aws_iam_policy_document" "website" {
  count = "${var.enabled ? 1 : 0}"

  statement {
    sid = "CloudFrontReadGetObject"

    principals {
      type = "AWS"

      identifiers = [
        "*",
      ]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.website.arn}/*",
    ]

    condition {
      test     = "StringNotEquals"
      variable = "aws:UserAgent"
      values   = ["${random_string.cloudfront_user_agent.result}"]
    }

    effect = "Deny"
  }
}

resource "aws_s3_bucket" "website" {
  count  = "${var.enabled ? 1 : 0}"
  bucket = "${var.s3_bucket_name}"
  acl    = "public-read"
  region = "${var.s3_bucket_region}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = "${var.s3_bucket_versioning_enabled}"
  }

  website = "${local.s3_config[var.redirect ? "redirect" : "website"]}"
  tags    = "${var.tags}"

  cors_rule = "${var.cors_rule}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_s3_bucket_policy" "website" {
  count  = "${var.enabled ? 1 : 0}"
  bucket = "${aws_s3_bucket.website.id}"
  policy = "${data.aws_iam_policy_document.website.json}"
}
