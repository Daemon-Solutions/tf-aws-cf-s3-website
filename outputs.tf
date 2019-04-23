output "cf_domain_name" {
  description = "The domain name corresponding to the CloudFront Distribution. For example: d604721fxaaqy9.cloudfront.net."
  value       = "${join("", aws_cloudfront_distribution.website.*.domain_name)}"
}

output "cf_hosted_zone_id" {
  description = "The CloudFront Route 53 zone ID that can be used to route an Alias Resource Record Set to. This attribute is simply an alias for the zone ID Z2FDTNDATAQYW2."
  value       = "${join("", aws_cloudfront_distribution.website.*.hosted_zone_id)}"
}

output "cf_arn" {
  description = "The ARN (Amazon Resource Name) for the CloudFront Distribution. For example: arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5, where 123456789012 is your AWS account ID."
  value       = "${join("", aws_cloudfront_distribution.website.*.arn)}"
}

output "cf_id" {
  description = "The identifier for the CloudFront Distribution. For example: EDFDVBD632BHDS5."
  value       = "${join("", aws_cloudfront_distribution.website.*.id)}"
}

output "s3_bucket_id" {
  description = "The name of the S3 Bucket."
  value       = "${join("", data.aws_s3_bucket.bucket.*.id)}"
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 Bucket."
  value       = "${join("", data.aws_s3_bucket.bucket.*.arn)}"
}

output "s3_bucket_domain_name" {
  description = "The bucket domain name for the website. Will be of format bucketname.s3.amazonaws.com."
  value       = "${join("", data.aws_s3_bucket.bucket.*.bucket_domain_name)}"
}

output "s3_bucket_endpoint" {
  description = "The website endpoint."
  value       = "${join("", data.aws_s3_bucket.bucket.*.website_endpoint)}"
}

output "s3_bucket_domain" {
  description = "The domain of the website endpoint. This is used to create Route 53 alias records."
  value       = "${join("", data.aws_s3_bucket.bucket.*.website_domain)}"
}
