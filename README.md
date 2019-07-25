# tf-aws-cf-s3-website
A CloudFront and S3 Bucket solution for the following two scenarios:
 - Hosting a static website.
 - Redirecting the web traffic to another website.

## Usage

```js
module "redirect" {
  source = "../"

  aliases             = ["example.com"]
  redirect_to         = "https://www.example.com"
  redirect            = true
  acm_certificate_arn = "${aws_acm_certificate_validation.cert.certificate_arn}"
  tags                = "${var.website_redirect_tags}"
  logging_bucket      = "${aws_s3_bucket.cloudfront_logs.bucket_domain_name}"
  logging_prefix      = "redirect"
  s3_bucket_name      = "trynottoclick-redirect"
}

module "website" {
  source              = "../"
  aliases             = ["www.example.com", "www.stage.example.com"]
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
      name    = "www.example.com"
      zone_id = "VA75R91YQ4YSXR"
    },
    {
      name    = "www.stage.example.com"
      zone_id = "ECK2X61SHOTGC2"
    },
  ]

  custom_error_responses = [
    {
      error_caching_min_ttl = 30
      error_code            = 400
      response_code         = 200
      response_page_path    = "/index.html"
    },
    {
      error_caching_min_ttl = 30
      error_code            = 403
      response_code         = 200
      response_page_path    = "/index.html"
    }
  ]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| acm\_certificate\_arn | The ARN of the AWS Certificate Manager certificate that you wish to use with this distribution. The ACM certificate must be in US-EAST-1 (N. Virginia). | string | n/a | yes |
| aliases | Extra CNAMEs (alternate domain names). | list | `<list>` | no |
| allowed\_methods | Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin. | list | `<list>` | no |
| aws_user_ids | A list of AWS User or Role UIDs to be excluded from the `GetObject Deny` in the S3 Bucket Policy. | list | `<list>` | no |
| cached\_methods | Controls whether CloudFront caches the response to requests using the specified HTTP methods. | list | `<list>` | no |
| comment | Any comments you want to include about the distribution. | string | `""` | no |
| cors\_rule | A rule of Cross-Origin Resource Sharing. | list | `<list>` | no |
| custom\_error\_responses | A list of custom error response elements. | list | `[]` | no |
| default\_root\_object | The filename or the HTML file to use/present when browsing to the website. | string | `"index.html"` | no |
| default\_ttl | The default amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header. | string | `"86400"` | no |
| enabled | Enable and create the CloudFront Distribution and S3 Bucket solution. | string | `"true"` | no |
| error\_document | The filename or the HTML file to use/present in the event of an error occuring. | string | `"index.html"` | no |
| geo\_restriction\_locations | The ISO 3166-1-alpha-2 codes for which you want CloudFront either to distribute your content (whitelist) or not distribute your content (blacklist). | list | `<list>` | no |
| geo\_restriction\_type | The method that you want to use to restrict distribution of your content by country: none, whitelist, or blacklist. | string | `"none"` | no |
| logging\_bucket | The Amazon S3 bucket to store the access logs in, for example, myawslogbucket.s3.amazonaws.com. | string | n/a | yes |
| logging\_include\_cookies | Specifies whether you want CloudFront to include cookies in access logs. | string | `"false"` | no |
| logging\_prefix | An optional string that you want CloudFront to prefix to the access log filenames for this distribution, for example, myprefix/. | string | `""` | no |
| max\_ttl | The maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated. Only effective in the presence of Cache-Control max-age, Cache-Control s-maxage, and Expires headers. | string | `"31536000"` | no |
| min\_ttl | The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated. | string | `"0"` | no |
| minimum\_ssl\_protocol\_version | The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections. One of SSLv3, TLSv1, TLSv1_2016, TLSv1.1_2016 or TLSv1.2_2018. | string | `"TLSv1.2_2018"` | no |
| price\_class | The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100. | string | `"PriceClass_All"` | no |
| redirect | Enable redirection mode. | string | `"false"` | no |
| redirect\_to | The URL that the web traffic will be redirected to. Eg. https://www.example.com | string | `""` | no |
| route53\_alias\_records | A list of maps of the domains in the CloudFront Distribution to the Route53 Zone IDs to be used to create DNS Alias records.  For example: ```route53_alias_records = [ { name = "www.example.com" zone_id = "Z123456" }, { name = "www.stage-example.com" zone_id = "Z123456" } ]```) | list | `<list>` | no |
| routing\_rules | A json array containing routing rules describing redirect behavior and when redirects are applied to a website. | string | `""` | no |
| s3\_bucket\_name | The name of the S3 Bucket to be created. | string | n/a | yes |
| s3\_bucket\_region | The AWS Region to create the S3 Bucket resource in. Defaults to current region. | string | `""` | no |
| s3\_bucket\_versioning\_enabled | Enable versioning. | string | `"true"` | no |
| smooth\_streaming | Indicates whether you want to distribute media files in Microsoft Smooth Streaming format using the origin that is associated with this cache behavior. | string | `"false"` | no |
| tags | The tags to associate with the resources. | map | `<map>` | no |
| viewer\_protocol\_policy | Use this element to specify the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern. One of `allow-all`, `https-only`, or `redirect-to-https`. | string | `"redirect-to-https"` | no |
| web\_acl\_id | Web ACL ID that can be attached to the Cloudfront distribution | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| cf\_arn | The ARN (Amazon Resource Name) for the CloudFront Distribution. For example: arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5, where 123456789012 is your AWS account ID. |
| cf\_domain\_name | The domain name corresponding to the CloudFront Distribution. For example: d604721fxaaqy9.cloudfront.net. |
| cf\_hosted\_zone\_id | The CloudFront Route 53 zone ID that can be used to route an Alias Resource Record Set to. This attribute is simply an alias for the zone ID Z2FDTNDATAQYW2. |
| cf\_id | The identifier for the CloudFront Distribution. For example: EDFDVBD632BHDS5. |
| s3\_bucket\_arn | The ARN of the S3 Bucket. |
| s3\_bucket\_domain\_name | The bucket domain name for the website. Will be of format bucketname.s3.amazonaws.com. |
| s3\_bucket\_id | The name of the S3 Bucket. |
| s3\_bucket\_website\_domain | The domain of the website endpoint. This is used to create Route 53 alias records. |
| s3\_bucket\_website\_endpoint | The website endpoint. |

## Note on the `aws_user_ids` Input variable.
To elaborate the ID format the aws:userid sees is:

```
UNIQUE-ROLE-ID:ROLE-SESSION-NAME
```

so if your Role ID is `AROA00000000000000000` when assumed it will be appended with a session name like `AROA00000000000000000:mysession` so either white list `AROA00000000000000000:mysession` and any other session names you will want to have as part of the exclusion to the `Deny` action or do a wild card match `AROA00000000000000000:*`.

If no AWS User IDs are specified, then you will only be able to perform the `GetObject` action on the objects n the S3 Bucket if you include the correct `user-agent` value in the header of the request.

Additional information can be found in the AWS `IAM Policy Elements: Variables and Tags` documentation which can be found at https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_variables.html

To get the AWS User or Role ID, you run the of the following commands using the AWS CLI:
```
aws iam get-user --user-name ReadOnlyUser | grep UserId
```
or
```
aws iam get-role --role-name ReadOnlyRole | grep RoleId
```
