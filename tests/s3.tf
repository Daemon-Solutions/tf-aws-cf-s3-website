data "aws_caller_identity" "current" {
}

data "aws_iam_policy_document" "cloudfront_logs" {
  statement {
    sid = "cloudfront_put_logs"

    principals {
      type = "AWS"

      identifiers = [
        data.aws_caller_identity.current.account_id,
      ]
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "${aws_s3_bucket.cloudfront_logs.arn}/*",
    ]
  }
}

resource "aws_s3_bucket" "cloudfront_logs" {
  bucket = "trynottoclick-cloudfront-logs"
  acl    = "private"

  force_destroy = true

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_s3_bucket_policy" "cloudfront_logs" {
  bucket = aws_s3_bucket.cloudfront_logs.id
  policy = data.aws_iam_policy_document.cloudfront_logs.json
}
