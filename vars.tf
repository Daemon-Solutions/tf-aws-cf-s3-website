variable "acm_certificate_arn" {
  description = "The ARN of the AWS Certificate Manager certificate that you wish to use with this distribution. The ACM certificate must be in US-EAST-1 (N. Virginia)."
  type        = string
}

variable "allowed_methods" {
  description = "Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin."
  type        = list(string)

  default = [
    "GET",
    "HEAD",
    "OPTIONS",
    "PUT",
    "POST",
    "PATCH",
    "DELETE",
  ]
}

variable "cached_methods" {
  description = "Controls whether CloudFront caches the response to requests using the specified HTTP methods."
  type        = list(string)

  default = [
    "GET",
    "HEAD",
    "OPTIONS",
  ]
}

variable "comment" {
  description = "Any comments you want to include about the distribution."
  type        = string
  default     = ""
}

variable "cors_rule" {
  description = "A rule of Cross-Origin Resource Sharing."
  type        = list(any)
  default     = []
}

variable "custom_error_responses" {
  description = "A list of custom error response elements."
  type        = list(string)
  default     = []
}

variable "default_ttl" {
  description = "The default amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header."
  type        = string
  default     = "86400"
}

variable "aliases" {
  description = "Extra CNAMEs (alternate domain names)."
  type        = list(string)
  default     = []
}

variable "enabled" {
  description = "Enable and create the CloudFront Distribution and S3 Bucket solution."
  default     = true
}

variable "error_document" {
  description = "The filename or the HTML file to use/present in the event of an error occuring."
  type        = string
  default     = "index.html"
}

variable "default_root_object" {
  description = "The filename or the HTML file to use/present when browsing to the website."
  type        = string
  default     = "index.html"
}

variable "geo_restriction_locations" {
  description = "The ISO 3166-1-alpha-2 codes for which you want CloudFront either to distribute your content (whitelist) or not distribute your content (blacklist)."
  type        = list(string)
  default     = []
}

variable "geo_restriction_type" {
  description = "The method that you want to use to restrict distribution of your content by country: none, whitelist, or blacklist."
  type        = string
  default     = "none"
}

variable "logging_bucket" {
  description = "The Amazon S3 bucket to store the access logs in, for example, myawslogbucket.s3.amazonaws.com."
  type        = string
}

variable "logging_include_cookies" {
  description = "Specifies whether you want CloudFront to include cookies in access logs."
  default     = false
}

variable "logging_prefix" {
  description = "An optional string that you want CloudFront to prefix to the access log filenames for this distribution, for example, myprefix/."
  type        = string
  default     = ""
}

variable "max_ttl" {
  description = "The maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated. Only effective in the presence of Cache-Control max-age, Cache-Control s-maxage, and Expires headers."
  type        = string
  default     = "31536000"
}

variable "min_ttl" {
  description = "The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated."
  default     = "0"
}

variable "minimum_ssl_protocol_version" {
  description = "The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections. One of SSLv3, TLSv1, TLSv1_2016, TLSv1.1_2016 or TLSv1.2_2018."
  type        = string
  default     = "TLSv1.2_2018"
}

variable "price_class" {
  description = "The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100."
  type        = string
  default     = "PriceClass_All"
}

variable "redirect" {
  description = "Enable redirection mode."
  default     = false
}

variable "redirect_to" {
  description = "The URL that the web traffic will be redirected to. Eg. https://www.example.com"
  type        = string
  default     = ""
}

variable "route53_alias_records" {
  description = "A list of maps of the domains in the CloudFront Distribution to the Route53 Zone IDs to be used to create DNS Alias records.  For example: ```route53_alias_records = [ { name = \"www.example.com\" zone_id = \"Z123456\" }, { name = \"www.stage-example.com\" zone_id = \"Z123456\" } ]```)"
  type        = list(map(string))
  default     = []
}

variable "routing_rules" {
  description = "A json array containing routing rules describing redirect behavior and when redirects are applied to a website."
  type        = string
  default     = ""
}

variable "s3_bucket_name" {
  description = "The name of the S3 Bucket to be created."
  type        = string
}

variable "s3_bucket_region" {
  description = "The AWS Region to create the S3 Bucket resource in. Defaults to current region."
  type        = string
  default     = ""
}

variable "s3_bucket_versioning_enabled" {
  description = "Enable versioning."
  default     = true
}

variable "smooth_streaming" {
  description = "Indicates whether you want to distribute media files in Microsoft Smooth Streaming format using the origin that is associated with this cache behavior."
  default     = false
}

variable "tags" {
  description = "The tags to associate with the resources."
  type        = map(string)
  default     = {}
}

variable "viewer_protocol_policy" {
  description = "Use this element to specify the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern. One of `allow-all`, `https-only`, or `redirect-to-https`."
  type        = string
  default     = "redirect-to-https"
}

variable "web_acl_id" {
  description = "Web ACL ID that can be attached to the Cloudfront distribution"
  type        = string
  default     = ""
}
