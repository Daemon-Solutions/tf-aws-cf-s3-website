data "aws_s3_bucket" "bucket" {
  count  = "${var.enabled ? 1 : 0}"
  bucket = "${var.s3_bucket_create ? aws_s3_bucket.website.id : var.s3_bucket_name}"
}

locals {
  s3_config = {
    redirect = [{
      redirect_all_requests_to = "${var.redirect_to}"
    }]

    website = [{
      index_document = "${var.index_document}"
      error_document = "${var.error_document}"
      routing_rules  = "${var.routing_rules}"
    }]
  }
}

data "aws_iam_policy_document" "website" {
  count = "${var.enabled && var.s3_bucket_create ? 1 : 0}"

  statement {
    sid = "CloudFrontReadGetObject"

    principals {
      type = "AWS"

      identifiers = [
        "${aws_cloudfront_origin_access_identity.website.iam_arn}",
      ]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${data.aws_s3_bucket.bucket.arn}/*",
    ]
  }
}

resource "aws_s3_bucket" "website" {
  count  = "${var.enabled && var.s3_bucket_create ? 1 : 0}"
  bucket = "${var.s3_bucket_name}"
  acl    = "private"
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
  count  = "${var.enabled && var.s3_bucket_create ? 1 : 0}"
  bucket = "${data.aws_s3_bucket.bucket.id}"
  policy = "${data.aws_iam_policy_document.website.json}"
}
