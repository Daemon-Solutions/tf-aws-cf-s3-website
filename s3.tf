locals {
  s3_config = {
    redirect = [
      {
        redirect_all_requests_to = var.redirect_to
      },
    ]
    website = [
      {
        index_document = var.default_root_object
        error_document = var.error_document
        routing_rules  = var.routing_rules
      },
    ]
  }
}

data "aws_iam_policy_document" "website" {
  count = var.enabled ? 1 : 0

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
      "${aws_s3_bucket.website[0].arn}/*",
    ]

    condition {
      test     = "StringNotEquals"
      variable = "aws:UserAgent"
      values   = [random_string.cloudfront_user_agent[0].result]
    }

    effect = "Deny"
  }
}

resource "aws_s3_bucket" "website" {
  count  = var.enabled ? 1 : 0
  bucket = var.s3_bucket_name
  acl    = "public-read"
  region = var.s3_bucket_region

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = var.s3_bucket_versioning_enabled
  }

  dynamic "website" {
    for_each = local.s3_config[var.redirect ? "redirect" : "website"]
    content {
      error_document           = lookup(website.value, "error_document", null)
      index_document           = lookup(website.value, "index_document", null)
      redirect_all_requests_to = lookup(website.value, "redirect_all_requests_to", null)
      routing_rules            = lookup(website.value, "routing_rules", null)
    }
  }

  dynamic "cors_rule" {
    for_each = var.cors_rule
    content {
      allowed_headers = lookup(cors_rule.value, "allowed_headers", null)
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      expose_headers  = lookup(cors_rule.value, "expose_headers", null)
      max_age_seconds = lookup(cors_rule.value, "max_age_seconds", null)
    }
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = var.tags
}

resource "aws_s3_bucket_policy" "website" {
  count  = var.enabled ? 1 : 0
  bucket = aws_s3_bucket.website[0].id
  policy = data.aws_iam_policy_document.website[0].json
}
