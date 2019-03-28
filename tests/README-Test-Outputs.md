## Terraform `plan` for a website and website redirection solution:
```
Terraform will perform the following actions:

 <= data.aws_iam_policy_document.cloudfront_logs
      id:                                                                                                    <computed>
      json:                                                                                                  <computed>
      statement.#:                                                                                           "1"
      statement.0.actions.#:                                                                                 "1"
      statement.0.actions.315547055:                                                                         "s3:PutObject"
      statement.0.effect:                                                                                    "Allow"
      statement.0.principals.#:                                                                              "1"
      statement.0.principals.602703666.identifiers.#:                                                        "1"
      statement.0.principals.602703666.identifiers.2548632368:                                               "483560084512"
      statement.0.principals.602703666.type:                                                                 "AWS"
      statement.0.resources.#:                                                                               <computed>
      statement.0.sid:                                                                                       "cloudfront_put_logs"
      version:                                                                                               "2012-10-17"

  + aws_acm_certificate.cert
      id:                                                                                                    <computed>
      arn:                                                                                                   <computed>
      domain_name:                                                                                           "www.trynotto.click"
      domain_validation_options.#:                                                                           <computed>
      subject_alternative_names.#:                                                                           "1"
      subject_alternative_names.0:                                                                           "trynotto.click"
      validation_emails.#:                                                                                   <computed>
      validation_method:                                                                                     "DNS"

  + aws_acm_certificate_validation.cert
      id:                                                                                                    <computed>
      certificate_arn:                                                                                       "${aws_acm_certificate.cert.arn}"
      validation_record_fqdns.#:                                                                             <computed>

  + aws_route53_record.cert_dns_validation_record_alternate
      id:                                                                                                    <computed>
      allow_overwrite:                                                                                       <computed>
      fqdn:                                                                                                  <computed>
      name:                                                                                                  "${aws_acm_certificate.cert.domain_validation_options.1.resource_record_name}"
      records.#:                                                                                             <computed>
      ttl:                                                                                                   "60"
      type:                                                                                                  "${aws_acm_certificate.cert.domain_validation_options.1.resource_record_type}"
      zone_id:                                                                                               "ZW7HC3OXIT5P9"

  + aws_route53_record.cert_dns_validation_record_base
      id:                                                                                                    <computed>
      allow_overwrite:                                                                                       <computed>
      fqdn:                                                                                                  <computed>
      name:                                                                                                  "${aws_acm_certificate.cert.domain_validation_options.0.resource_record_name}"
      records.#:                                                                                             <computed>
      ttl:                                                                                                   "60"
      type:                                                                                                  "${aws_acm_certificate.cert.domain_validation_options.0.resource_record_type}"
      zone_id:                                                                                               "ZW7HC3OXIT5P9"

  + aws_route53_record.redirection_dns
      id:                                                                                                    <computed>
      alias.#:                                                                                               "1"
      alias.~2240707583.evaluate_target_health:                                                              "true"
      alias.~2240707583.name:                                                                                "${module.redirect.cf_domain_name}"
      alias.~2240707583.zone_id:                                                                             "${module.redirect.cf_hosted_zone_id}"
      allow_overwrite:                                                                                       <computed>
      fqdn:                                                                                                  <computed>
      name:                                                                                                  "trynotto.click"
      type:                                                                                                  "A"
      zone_id:                                                                                               "ZW7HC3OXIT5P9"

  + aws_route53_record.website_dns
      id:                                                                                                    <computed>
      alias.#:                                                                                               "1"
      alias.~3169377270.evaluate_target_health:                                                              "true"
      alias.~3169377270.name:                                                                                "${module.website.cf_domain_name}"
      alias.~3169377270.zone_id:                                                                             "${module.website.cf_hosted_zone_id}"
      allow_overwrite:                                                                                       <computed>
      fqdn:                                                                                                  <computed>
      name:                                                                                                  "www.trynotto.click"
      type:                                                                                                  "A"
      zone_id:                                                                                               "ZW7HC3OXIT5P9"

  + aws_s3_bucket.cloudfront_logs
      id:                                                                                                    <computed>
      acceleration_status:                                                                                   <computed>
      acl:                                                                                                   "private"
      arn:                                                                                                   <computed>
      bucket:                                                                                                "trynottoclick-cloudfront-logs"
      bucket_domain_name:                                                                                    <computed>
      bucket_regional_domain_name:                                                                           <computed>
      force_destroy:                                                                                         "true"
      hosted_zone_id:                                                                                        <computed>
      region:                                                                                                <computed>
      request_payer:                                                                                         <computed>
      server_side_encryption_configuration.#:                                                                "1"
      server_side_encryption_configuration.0.rule.#:                                                         "1"
      server_side_encryption_configuration.0.rule.0.apply_server_side_encryption_by_default.#:               "1"
      server_side_encryption_configuration.0.rule.0.apply_server_side_encryption_by_default.0.sse_algorithm: "AES256"
      versioning.#:                                                                                          "1"
      versioning.0.enabled:                                                                                  "true"
      versioning.0.mfa_delete:                                                                               "false"
      website_domain:                                                                                        <computed>
      website_endpoint:                                                                                      <computed>

  + aws_s3_bucket_policy.cloudfront_logs
      id:                                                                                                    <computed>
      bucket:                                                                                                "${aws_s3_bucket.cloudfront_logs.id}"
      policy:                                                                                                "${data.aws_iam_policy_document.cloudfront_logs.json}"

 <= module.redirect.data.aws_iam_policy_document.website
      id:                                                                                                    <computed>
      json:                                                                                                  <computed>
      statement.#:                                                                                           "1"
      statement.0.actions.#:                                                                                 "1"
      statement.0.actions.2071725391:                                                                        "s3:GetObject"
      statement.0.effect:                                                                                    "Allow"
      statement.0.principals.#:                                                                              "1"
      statement.0.principals.~3303760437.identifiers.#:                                                      <computed>
      statement.0.principals.~3303760437.type:                                                               "AWS"
      statement.0.resources.#:                                                                               <computed>
      statement.0.sid:                                                                                       "CloudFrontReadGetObject"
      version:                                                                                               "2012-10-17"

  + module.redirect.aws_cloudfront_distribution.website
      id:                                                                                                    <computed>
      active_trusted_signers.%:                                                                              <computed>
      aliases.#:                                                                                             "1"
      aliases.3668227380:                                                                                    "trynotto.click"
      arn:                                                                                                   <computed>
      caller_reference:                                                                                      <computed>
      default_cache_behavior.#:                                                                              "1"
      default_cache_behavior.0.allowed_methods.#:                                                            "7"
      default_cache_behavior.0.allowed_methods.1012961568:                                                   "POST"
      default_cache_behavior.0.allowed_methods.1040875975:                                                   "GET"
      default_cache_behavior.0.allowed_methods.1445840968:                                                   "HEAD"
      default_cache_behavior.0.allowed_methods.1741119464:                                                   "PATCH"
      default_cache_behavior.0.allowed_methods.348445828:                                                    "DELETE"
      default_cache_behavior.0.allowed_methods.3982006612:                                                   "OPTIONS"
      default_cache_behavior.0.allowed_methods.4024585617:                                                   "PUT"
      default_cache_behavior.0.cached_methods.#:                                                             "3"
      default_cache_behavior.0.cached_methods.1040875975:                                                    "GET"
      default_cache_behavior.0.cached_methods.1445840968:                                                    "HEAD"
      default_cache_behavior.0.cached_methods.3982006612:                                                    "OPTIONS"
      default_cache_behavior.0.compress:                                                                     "true"
      default_cache_behavior.0.default_ttl:                                                                  "86400"
      default_cache_behavior.0.forwarded_values.#:                                                           "1"
      default_cache_behavior.0.forwarded_values.0.cookies.#:                                                 "1"
      default_cache_behavior.0.forwarded_values.0.cookies.0.forward:                                         "none"
      default_cache_behavior.0.forwarded_values.0.query_string:                                              "false"
      default_cache_behavior.0.max_ttl:                                                                      "31536000"
      default_cache_behavior.0.min_ttl:                                                                      "0"
      default_cache_behavior.0.smooth_streaming:                                                             "false"
      default_cache_behavior.0.target_origin_id:                                                             "${join(\"\", concat(aws_s3_bucket.website.*.id))}"
      default_cache_behavior.0.viewer_protocol_policy:                                                       "redirect-to-https"
      default_root_object:                                                                                   "index.html"
      domain_name:                                                                                           <computed>
      enabled:                                                                                               "true"
      etag:                                                                                                  <computed>
      hosted_zone_id:                                                                                        <computed>
      http_version:                                                                                          "http2"
      in_progress_validation_batches:                                                                        <computed>
      is_ipv6_enabled:                                                                                       "true"
      last_modified_time:                                                                                    <computed>
      logging_config.#:                                                                                      "1"
      logging_config.0.bucket:                                                                               "${var.logging_bucket}"
      logging_config.0.include_cookies:                                                                      "false"
      logging_config.0.prefix:                                                                               "redirect"
      origin.#:                                                                                              "1"
      origin.~291275238.custom_header.#:                                                                     "0"
      origin.~291275238.custom_origin_config.#:                                                              "0"
      origin.~291275238.domain_name:                                                                         "${join(\"\", concat(aws_s3_bucket.website.*.bucket_regional_domain_name))}"
      origin.~291275238.origin_id:                                                                           "${join(\"\", concat(aws_s3_bucket.website.*.id))}"
      origin.~291275238.origin_path:                                                                         ""
      origin.~291275238.s3_origin_config.#:                                                                  "1"
      origin.~291275238.s3_origin_config.0.origin_access_identity:                                           "${aws_cloudfront_origin_access_identity.website.cloudfront_access_identity_path}"
      price_class:                                                                                           "PriceClass_All"
      restrictions.#:                                                                                        "1"
      restrictions.0.geo_restriction.#:                                                                      "1"
      restrictions.0.geo_restriction.0.restriction_type:                                                     "none"
      retain_on_delete:                                                                                      "false"
      status:                                                                                                <computed>
      tags.%:                                                                                                "2"
      tags.environment:                                                                                      "prod"
      tags.purpose:                                                                                          "Redirection of web traffic to another website"
      viewer_certificate.#:                                                                                  "1"
      viewer_certificate.0.acm_certificate_arn:                                                              "${var.acm_certificate_arn}"
      viewer_certificate.0.cloudfront_default_certificate:                                                   "false"
      viewer_certificate.0.minimum_protocol_version:                                                         "TLSv1.2_2018"
      viewer_certificate.0.ssl_support_method:                                                               "sni-only"

  + module.redirect.aws_cloudfront_origin_access_identity.website
      id:                                                                                                    <computed>
      caller_reference:                                                                                      <computed>
      cloudfront_access_identity_path:                                                                       <computed>
      comment:                                                                                               "The origin access identity for website and redirection solution."
      etag:                                                                                                  <computed>
      iam_arn:                                                                                               <computed>
      s3_canonical_user_id:                                                                                  <computed>

  + module.redirect.aws_s3_bucket.website
      id:                                                                                                    <computed>
      acceleration_status:                                                                                   <computed>
      acl:                                                                                                   "private"
      arn:                                                                                                   <computed>
      bucket:                                                                                                "trynottoclick-redirect"
      bucket_domain_name:                                                                                    <computed>
      bucket_regional_domain_name:                                                                           <computed>
      force_destroy:                                                                                         "false"
      hosted_zone_id:                                                                                        <computed>
      region:                                                                                                <computed>
      request_payer:                                                                                         <computed>
      server_side_encryption_configuration.#:                                                                "1"
      server_side_encryption_configuration.0.rule.#:                                                         "1"
      server_side_encryption_configuration.0.rule.0.apply_server_side_encryption_by_default.#:               "1"
      server_side_encryption_configuration.0.rule.0.apply_server_side_encryption_by_default.0.sse_algorithm: "AES256"
      tags.%:                                                                                                "2"
      tags.environment:                                                                                      "prod"
      tags.purpose:                                                                                          "Redirection of web traffic to another website"
      versioning.#:                                                                                          "1"
      versioning.0.enabled:                                                                                  "true"
      versioning.0.mfa_delete:                                                                               "false"
      website.#:                                                                                             "1"
      website.0.redirect_all_requests_to:                                                                    "https://www.trynotto.click"
      website_domain:                                                                                        <computed>
      website_endpoint:                                                                                      <computed>

  + module.redirect.aws_s3_bucket_policy.website
      id:                                                                                                    <computed>
      bucket:                                                                                                "${aws_s3_bucket.website.id}"
      policy:                                                                                                "${data.aws_iam_policy_document.website.json}"

 <= module.website.data.aws_iam_policy_document.website
      id:                                                                                                    <computed>
      json:                                                                                                  <computed>
      statement.#:                                                                                           "1"
      statement.0.actions.#:                                                                                 "1"
      statement.0.actions.2071725391:                                                                        "s3:GetObject"
      statement.0.effect:                                                                                    "Allow"
      statement.0.principals.#:                                                                              "1"
      statement.0.principals.~3303760437.identifiers.#:                                                      <computed>
      statement.0.principals.~3303760437.type:                                                               "AWS"
      statement.0.resources.#:                                                                               <computed>
      statement.0.sid:                                                                                       "CloudFrontReadGetObject"
      version:                                                                                               "2012-10-17"

  + module.website.aws_cloudfront_distribution.website
      id:                                                                                                    <computed>
      active_trusted_signers.%:                                                                              <computed>
      aliases.#:                                                                                             "1"
      aliases.1196245549:                                                                                    "www.trynotto.click"
      arn:                                                                                                   <computed>
      caller_reference:                                                                                      <computed>
      default_cache_behavior.#:                                                                              "1"
      default_cache_behavior.0.allowed_methods.#:                                                            "7"
      default_cache_behavior.0.allowed_methods.1012961568:                                                   "POST"
      default_cache_behavior.0.allowed_methods.1040875975:                                                   "GET"
      default_cache_behavior.0.allowed_methods.1445840968:                                                   "HEAD"
      default_cache_behavior.0.allowed_methods.1741119464:                                                   "PATCH"
      default_cache_behavior.0.allowed_methods.348445828:                                                    "DELETE"
      default_cache_behavior.0.allowed_methods.3982006612:                                                   "OPTIONS"
      default_cache_behavior.0.allowed_methods.4024585617:                                                   "PUT"
      default_cache_behavior.0.cached_methods.#:                                                             "3"
      default_cache_behavior.0.cached_methods.1040875975:                                                    "GET"
      default_cache_behavior.0.cached_methods.1445840968:                                                    "HEAD"
      default_cache_behavior.0.cached_methods.3982006612:                                                    "OPTIONS"
      default_cache_behavior.0.compress:                                                                     "true"
      default_cache_behavior.0.default_ttl:                                                                  "86400"
      default_cache_behavior.0.forwarded_values.#:                                                           "1"
      default_cache_behavior.0.forwarded_values.0.cookies.#:                                                 "1"
      default_cache_behavior.0.forwarded_values.0.cookies.0.forward:                                         "none"
      default_cache_behavior.0.forwarded_values.0.query_string:                                              "false"
      default_cache_behavior.0.max_ttl:                                                                      "31536000"
      default_cache_behavior.0.min_ttl:                                                                      "0"
      default_cache_behavior.0.smooth_streaming:                                                             "false"
      default_cache_behavior.0.target_origin_id:                                                             "${join(\"\", concat(aws_s3_bucket.website.*.id))}"
      default_cache_behavior.0.viewer_protocol_policy:                                                       "redirect-to-https"
      default_root_object:                                                                                   "index.html"
      domain_name:                                                                                           <computed>
      enabled:                                                                                               "true"
      etag:                                                                                                  <computed>
      hosted_zone_id:                                                                                        <computed>
      http_version:                                                                                          "http2"
      in_progress_validation_batches:                                                                        <computed>
      is_ipv6_enabled:                                                                                       "true"
      last_modified_time:                                                                                    <computed>
      logging_config.#:                                                                                      "1"
      logging_config.0.bucket:                                                                               "${var.logging_bucket}"
      logging_config.0.include_cookies:                                                                      "false"
      logging_config.0.prefix:                                                                               "website"
      origin.#:                                                                                              "1"
      origin.~291275238.custom_header.#:                                                                     "0"
      origin.~291275238.custom_origin_config.#:                                                              "0"
      origin.~291275238.domain_name:                                                                         "${join(\"\", concat(aws_s3_bucket.website.*.bucket_regional_domain_name))}"
      origin.~291275238.origin_id:                                                                           "${join(\"\", concat(aws_s3_bucket.website.*.id))}"
      origin.~291275238.origin_path:                                                                         ""
      origin.~291275238.s3_origin_config.#:                                                                  "1"
      origin.~291275238.s3_origin_config.0.origin_access_identity:                                           "${aws_cloudfront_origin_access_identity.website.cloudfront_access_identity_path}"
      price_class:                                                                                           "PriceClass_All"
      restrictions.#:                                                                                        "1"
      restrictions.0.geo_restriction.#:                                                                      "1"
      restrictions.0.geo_restriction.0.restriction_type:                                                     "none"
      retain_on_delete:                                                                                      "false"
      status:                                                                                                <computed>
      tags.%:                                                                                                "2"
      tags.environment:                                                                                      "prod"
      tags.purpose:                                                                                          "Website for a domain"
      viewer_certificate.#:                                                                                  "1"
      viewer_certificate.0.acm_certificate_arn:                                                              "${var.acm_certificate_arn}"
      viewer_certificate.0.cloudfront_default_certificate:                                                   "false"
      viewer_certificate.0.minimum_protocol_version:                                                         "TLSv1.2_2018"
      viewer_certificate.0.ssl_support_method:                                                               "sni-only"

  + module.website.aws_cloudfront_origin_access_identity.website
      id:                                                                                                    <computed>
      caller_reference:                                                                                      <computed>
      cloudfront_access_identity_path:                                                                       <computed>
      comment:                                                                                               "The origin access identity for website and redirection solution."
      etag:                                                                                                  <computed>
      iam_arn:                                                                                               <computed>
      s3_canonical_user_id:                                                                                  <computed>

  + module.website.aws_s3_bucket.website
      id:                                                                                                    <computed>
      acceleration_status:                                                                                   <computed>
      acl:                                                                                                   "private"
      arn:                                                                                                   <computed>
      bucket:                                                                                                "trynottoclick-website"
      bucket_domain_name:                                                                                    <computed>
      bucket_regional_domain_name:                                                                           <computed>
      force_destroy:                                                                                         "false"
      hosted_zone_id:                                                                                        <computed>
      region:                                                                                                <computed>
      request_payer:                                                                                         <computed>
      server_side_encryption_configuration.#:                                                                "1"
      server_side_encryption_configuration.0.rule.#:                                                         "1"
      server_side_encryption_configuration.0.rule.0.apply_server_side_encryption_by_default.#:               "1"
      server_side_encryption_configuration.0.rule.0.apply_server_side_encryption_by_default.0.sse_algorithm: "AES256"
      tags.%:                                                                                                "2"
      tags.environment:                                                                                      "prod"
      tags.purpose:                                                                                          "Website for a domain"
      versioning.#:                                                                                          "1"
      versioning.0.enabled:                                                                                  "true"
      versioning.0.mfa_delete:                                                                               "false"
      website.#:                                                                                             "1"
      website.0.error_document:                                                                              "index.html"
      website.0.index_document:                                                                              "index.html"
      website_domain:                                                                                        <computed>
      website_endpoint:                                                                                      <computed>

  + module.website.aws_s3_bucket_policy.website
      id:                                                                                                    <computed>
      bucket:                                                                                                "${aws_s3_bucket.website.id}"
      policy:                                                                                                "${data.aws_iam_policy_document.website.json}"


Plan: 16 to add, 0 to change, 0 to destroy.
```
## Terraform `apply` for a website and website redirection solution:
```
terraform apply ./website-redirect.plan
module.redirect.aws_cloudfront_origin_access_identity.website: Creating...
  caller_reference:                "" => "<computed>"
  cloudfront_access_identity_path: "" => "<computed>"
  comment:                         "" => "The origin access identity for website and redirection solution."
  etag:                            "" => "<computed>"
  iam_arn:                         "" => "<computed>"
  s3_canonical_user_id:            "" => "<computed>"
module.website.aws_cloudfront_origin_access_identity.website: Creating...
  caller_reference:                "" => "<computed>"
  cloudfront_access_identity_path: "" => "<computed>"
  comment:                         "" => "The origin access identity for website and redirection solution."
  etag:                            "" => "<computed>"
  iam_arn:                         "" => "<computed>"
  s3_canonical_user_id:            "" => "<computed>"
module.redirect.aws_s3_bucket.website: Creating...
  acceleration_status:                                                                                   "" => "<computed>"
  acl:                                                                                                   "" => "private"
  arn:                                                                                                   "" => "<computed>"
  bucket:                                                                                                "" => "trynottoclick-redirect"
  bucket_domain_name:                                                                                    "" => "<computed>"
  bucket_regional_domain_name:                                                                           "" => "<computed>"
  force_destroy:                                                                                         "" => "false"
  hosted_zone_id:                                                                                        "" => "<computed>"
  region:                                                                                                "" => "<computed>"
  request_payer:                                                                                         "" => "<computed>"
  server_side_encryption_configuration.#:                                                                "" => "1"
  server_side_encryption_configuration.0.rule.#:                                                         "" => "1"
  server_side_encryption_configuration.0.rule.0.apply_server_side_encryption_by_default.#:               "" => "1"
  server_side_encryption_configuration.0.rule.0.apply_server_side_encryption_by_default.0.sse_algorithm: "" => "AES256"
  tags.%:                                                                                                "" => "2"
  tags.environment:                                                                                      "" => "prod"
  tags.purpose:                                                                                          "" => "Redirection of web traffic to another website"
  versioning.#:                                                                                          "" => "1"
  versioning.0.enabled:                                                                                  "" => "true"
  versioning.0.mfa_delete:                                                                               "" => "false"
  website.#:                                                                                             "" => "1"
  website.0.redirect_all_requests_to:                                                                    "" => "https://www.trynotto.click"
  website_domain:                                                                                        "" => "<computed>"
  website_endpoint:                                                                                      "" => "<computed>"
aws_s3_bucket.cloudfront_logs: Creating...
  acceleration_status:                                                                                   "" => "<computed>"
  acl:                                                                                                   "" => "private"
  arn:                                                                                                   "" => "<computed>"
  bucket:                                                                                                "" => "trynottoclick-cloudfront-logs"
  bucket_domain_name:                                                                                    "" => "<computed>"
  bucket_regional_domain_name:                                                                           "" => "<computed>"
  force_destroy:                                                                                         "" => "true"
  hosted_zone_id:                                                                                        "" => "<computed>"
  region:                                                                                                "" => "<computed>"
  request_payer:                                                                                         "" => "<computed>"
  server_side_encryption_configuration.#:                                                                "" => "1"
  server_side_encryption_configuration.0.rule.#:                                                         "" => "1"
  server_side_encryption_configuration.0.rule.0.apply_server_side_encryption_by_default.#:               "" => "1"
  server_side_encryption_configuration.0.rule.0.apply_server_side_encryption_by_default.0.sse_algorithm: "" => "AES256"
  versioning.#:                                                                                          "" => "1"
  versioning.0.enabled:                                                                                  "" => "true"
  versioning.0.mfa_delete:                                                                               "" => "false"
  website_domain:                                                                                        "" => "<computed>"
  website_endpoint:                                                                                      "" => "<computed>"
module.website.aws_s3_bucket.website: Creating...
  acceleration_status:                                                                                   "" => "<computed>"
  acl:                                                                                                   "" => "private"
  arn:                                                                                                   "" => "<computed>"
  bucket:                                                                                                "" => "trynottoclick-website"
  bucket_domain_name:                                                                                    "" => "<computed>"
  bucket_regional_domain_name:                                                                           "" => "<computed>"
  force_destroy:                                                                                         "" => "false"
  hosted_zone_id:                                                                                        "" => "<computed>"
  region:                                                                                                "" => "<computed>"
  request_payer:                                                                                         "" => "<computed>"
  server_side_encryption_configuration.#:                                                                "" => "1"
  server_side_encryption_configuration.0.rule.#:                                                         "" => "1"
  server_side_encryption_configuration.0.rule.0.apply_server_side_encryption_by_default.#:               "" => "1"
  server_side_encryption_configuration.0.rule.0.apply_server_side_encryption_by_default.0.sse_algorithm: "" => "AES256"
  tags.%:                                                                                                "" => "2"
  tags.environment:                                                                                      "" => "prod"
  tags.purpose:                                                                                          "" => "Website for a domain"
  versioning.#:                                                                                          "" => "1"
  versioning.0.enabled:                                                                                  "" => "true"
  versioning.0.mfa_delete:                                                                               "" => "false"
  website.#:                                                                                             "" => "1"
  website.0.error_document:                                                                              "" => "index.html"
  website.0.index_document:                                                                              "" => "index.html"
  website_domain:                                                                                        "" => "<computed>"
  website_endpoint:                                                                                      "" => "<computed>"
aws_acm_certificate.cert: Creating...
  arn:                         "" => "<computed>"
  domain_name:                 "" => "www.trynotto.click"
  domain_validation_options.#: "" => "<computed>"
  subject_alternative_names.#: "" => "1"
  subject_alternative_names.0: "" => "trynotto.click"
  validation_emails.#:         "" => "<computed>"
  validation_method:           "" => "DNS"
module.redirect.aws_cloudfront_origin_access_identity.website: Creation complete after 2s (ID: E366FDMNMC6AWF)
module.website.aws_cloudfront_origin_access_identity.website: Creation complete after 2s (ID: ETXPDT4C5ZVK2)
aws_s3_bucket.cloudfront_logs: Creation complete after 4s (ID: trynottoclick-cloudfront-logs)
data.aws_iam_policy_document.cloudfront_logs: Refreshing state...
aws_s3_bucket_policy.cloudfront_logs: Creating...
  bucket: "" => "trynottoclick-cloudfront-logs"
  policy: "" => "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"cloudfront_put_logs\",\n      \"Effect\": \"Allow\",\n      \"Action\": \"s3:PutObject\",\n      \"Resource\": \"arn:aws:s3:::trynottoclick-cloudfront-logs/*\",\n      \"Principal\": {\n        \"AWS\": \"483560084512\"\n      }\n    }\n  ]\n}"
aws_s3_bucket_policy.cloudfront_logs: Creation complete after 0s (ID: trynottoclick-cloudfront-logs)
module.redirect.aws_s3_bucket.website: Creation complete after 5s (ID: trynottoclick-redirect)
module.redirect.data.aws_iam_policy_document.website: Refreshing state...
module.redirect.aws_s3_bucket_policy.website: Creating...
  bucket: "" => "trynottoclick-redirect"
  policy: "" => "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudFrontReadGetObject\",\n      \"Effect\": \"Allow\",\n      \"Action\": \"s3:GetObject\",\n      \"Resource\": \"arn:aws:s3:::trynottoclick-redirect/*\",\n      \"Principal\": {\n        \"AWS\": \"arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E366FDMNMC6AWF\"\n      }\n    }\n  ]\n}"
module.website.aws_s3_bucket.website: Creation complete after 5s (ID: trynottoclick-website)
module.website.data.aws_iam_policy_document.website: Refreshing state...
module.website.aws_s3_bucket_policy.website: Creating...
  bucket: "" => "trynottoclick-website"
  policy: "" => "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudFrontReadGetObject\",\n      \"Effect\": \"Allow\",\n      \"Action\": \"s3:GetObject\",\n      \"Resource\": \"arn:aws:s3:::trynottoclick-website/*\",\n      \"Principal\": {\n        \"AWS\": \"arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ETXPDT4C5ZVK2\"\n      }\n    }\n  ]\n}"
aws_acm_certificate.cert: Creation complete after 6s (ID: arn:aws:acm:us-east-1:483560084512:cert...e/22e266c6-e33f-481c-9f0e-ed6e52fe907a)
aws_route53_record.cert_dns_validation_record_alternate: Creating...
  allow_overwrite:    "" => "<computed>"
  fqdn:               "" => "<computed>"
  name:               "" => "_f6e5f672a26f07348fad30cdd9d7afa8.trynotto.click"
  records.#:          "" => "1"
  records.3129820620: "" => "_76e7f4805c9d6b187d0ed05536ff6c4f.acm-validations.aws."
  ttl:                "" => "60"
  type:               "" => "CNAME"
  zone_id:            "" => "ZW7HC3OXIT5P9"
aws_route53_record.cert_dns_validation_record_base: Creating...
  allow_overwrite:   "" => "<computed>"
  fqdn:              "" => "<computed>"
  name:              "" => "_ca6998f3082ada8a88e097d30cd1482f.www.trynotto.click"
  records.#:         "" => "1"
  records.653906757: "" => "_18f0fc97f2783c22437478dec147275c.hkvuiqjoua.acm-validations.aws."
  ttl:               "" => "60"
  type:              "" => "CNAME"
  zone_id:           "" => "ZW7HC3OXIT5P9"
module.redirect.aws_s3_bucket_policy.website: Creation complete after 8s (ID: trynottoclick-redirect)
module.website.aws_s3_bucket_policy.website: Creation complete after 8s (ID: trynottoclick-website)
aws_route53_record.cert_dns_validation_record_base: Still creating... (10s elapsed)
aws_route53_record.cert_dns_validation_record_alternate: Still creating... (10s elapsed)
aws_route53_record.cert_dns_validation_record_alternate: Still creating... (20s elapsed)
aws_route53_record.cert_dns_validation_record_base: Still creating... (20s elapsed)
aws_route53_record.cert_dns_validation_record_alternate: Still creating... (30s elapsed)
aws_route53_record.cert_dns_validation_record_base: Still creating... (30s elapsed)
aws_route53_record.cert_dns_validation_record_base: Still creating... (40s elapsed)
aws_route53_record.cert_dns_validation_record_alternate: Still creating... (40s elapsed)
aws_route53_record.cert_dns_validation_record_base: Creation complete after 43s (ID: ZW7HC3OXIT5P9__ca6998f3082ada8a88e097d30cd1482f.www.trynotto.click._CNAME)
aws_route53_record.cert_dns_validation_record_alternate: Creation complete after 43s (ID: ZW7HC3OXIT5P9__f6e5f672a26f07348fad30cdd9d7afa8.trynotto.click._CNAME)
aws_acm_certificate_validation.cert: Creating...
  certificate_arn:                    "" => "arn:aws:acm:us-east-1:483560084512:certificate/22e266c6-e33f-481c-9f0e-ed6e52fe907a"
  validation_record_fqdns.#:          "" => "2"
  validation_record_fqdns.1710979842: "" => "_f6e5f672a26f07348fad30cdd9d7afa8.trynotto.click"
  validation_record_fqdns.3516239149: "" => "_ca6998f3082ada8a88e097d30cd1482f.www.trynotto.click"
aws_acm_certificate_validation.cert: Still creating... (10s elapsed)
aws_acm_certificate_validation.cert: Still creating... (20s elapsed)
aws_acm_certificate_validation.cert: Still creating... (30s elapsed)
aws_acm_certificate_validation.cert: Still creating... (40s elapsed)
aws_acm_certificate_validation.cert: Still creating... (50s elapsed)
aws_acm_certificate_validation.cert: Still creating... (1m0s elapsed)
aws_acm_certificate_validation.cert: Creation complete after 1m1s (ID: 2019-03-28 09:36:13 +0000 UTC)
module.redirect.aws_cloudfront_distribution.website: Creating...
  active_trusted_signers.%:                                      "" => "<computed>"
  aliases.#:                                                     "0" => "1"
  aliases.3668227380:                                            "" => "trynotto.click"
  arn:                                                           "" => "<computed>"
  caller_reference:                                              "" => "<computed>"
  default_cache_behavior.#:                                      "0" => "1"
  default_cache_behavior.0.allowed_methods.#:                    "0" => "7"
  default_cache_behavior.0.allowed_methods.1012961568:           "" => "POST"
  default_cache_behavior.0.allowed_methods.1040875975:           "" => "GET"
  default_cache_behavior.0.allowed_methods.1445840968:           "" => "HEAD"
  default_cache_behavior.0.allowed_methods.1741119464:           "" => "PATCH"
  default_cache_behavior.0.allowed_methods.348445828:            "" => "DELETE"
  default_cache_behavior.0.allowed_methods.3982006612:           "" => "OPTIONS"
  default_cache_behavior.0.allowed_methods.4024585617:           "" => "PUT"
  default_cache_behavior.0.cached_methods.#:                     "0" => "3"
  default_cache_behavior.0.cached_methods.1040875975:            "" => "GET"
  default_cache_behavior.0.cached_methods.1445840968:            "" => "HEAD"
  default_cache_behavior.0.cached_methods.3982006612:            "" => "OPTIONS"
  default_cache_behavior.0.compress:                             "" => "true"
  default_cache_behavior.0.default_ttl:                          "" => "86400"
  default_cache_behavior.0.forwarded_values.#:                   "0" => "1"
  default_cache_behavior.0.forwarded_values.0.cookies.#:         "0" => "1"
  default_cache_behavior.0.forwarded_values.0.cookies.0.forward: "" => "none"
  default_cache_behavior.0.forwarded_values.0.query_string:      "" => "false"
  default_cache_behavior.0.max_ttl:                              "" => "31536000"
  default_cache_behavior.0.min_ttl:                              "" => "0"
  default_cache_behavior.0.smooth_streaming:                     "" => "false"
  default_cache_behavior.0.target_origin_id:                     "" => "trynottoclick-redirect"
  default_cache_behavior.0.viewer_protocol_policy:               "" => "redirect-to-https"
  default_root_object:                                           "" => "index.html"
  domain_name:                                                   "" => "<computed>"
  enabled:                                                       "" => "true"
  etag:                                                          "" => "<computed>"
  hosted_zone_id:                                                "" => "<computed>"
  http_version:                                                  "" => "http2"
  in_progress_validation_batches:                                "" => "<computed>"
  is_ipv6_enabled:                                               "" => "true"
  last_modified_time:                                            "" => "<computed>"
  logging_config.#:                                              "0" => "1"
  logging_config.0.bucket:                                       "" => "trynottoclick-cloudfront-logs.s3.amazonaws.com"
  logging_config.0.include_cookies:                              "" => "false"
  logging_config.0.prefix:                                       "" => "redirect"
  origin.#:                                                      "0" => "1"
  origin.3766747412.custom_header.#:                             "0" => "0"
  origin.3766747412.custom_origin_config.#:                      "0" => "0"
  origin.3766747412.domain_name:                                 "" => "trynottoclick-redirect.s3.eu-west-1.amazonaws.com"
  origin.3766747412.origin_id:                                   "" => "trynottoclick-redirect"
  origin.3766747412.origin_path:                                 "" => ""
  origin.3766747412.s3_origin_config.#:                          "0" => "1"
  origin.3766747412.s3_origin_config.0.origin_access_identity:   "" => "origin-access-identity/cloudfront/E366FDMNMC6AWF"
  price_class:                                                   "" => "PriceClass_All"
  restrictions.#:                                                "0" => "1"
  restrictions.0.geo_restriction.#:                              "0" => "1"
  restrictions.0.geo_restriction.0.restriction_type:             "" => "none"
  retain_on_delete:                                              "" => "false"
  status:                                                        "" => "<computed>"
  tags.%:                                                        "0" => "2"
  tags.environment:                                              "" => "prod"
  tags.purpose:                                                  "" => "Redirection of web traffic to another website"
  viewer_certificate.#:                                          "0" => "1"
  viewer_certificate.0.acm_certificate_arn:                      "" => "arn:aws:acm:us-east-1:483560084512:certificate/22e266c6-e33f-481c-9f0e-ed6e52fe907a"
  viewer_certificate.0.cloudfront_default_certificate:           "" => "false"
  viewer_certificate.0.minimum_protocol_version:                 "" => "TLSv1.2_2018"
  viewer_certificate.0.ssl_support_method:                       "" => "sni-only"
module.website.aws_cloudfront_distribution.website: Creating...
  active_trusted_signers.%:                                      "" => "<computed>"
  aliases.#:                                                     "0" => "1"
  aliases.1196245549:                                            "" => "www.trynotto.click"
  arn:                                                           "" => "<computed>"
  caller_reference:                                              "" => "<computed>"
  default_cache_behavior.#:                                      "0" => "1"
  default_cache_behavior.0.allowed_methods.#:                    "0" => "7"
  default_cache_behavior.0.allowed_methods.1012961568:           "" => "POST"
  default_cache_behavior.0.allowed_methods.1040875975:           "" => "GET"
  default_cache_behavior.0.allowed_methods.1445840968:           "" => "HEAD"
  default_cache_behavior.0.allowed_methods.1741119464:           "" => "PATCH"
  default_cache_behavior.0.allowed_methods.348445828:            "" => "DELETE"
  default_cache_behavior.0.allowed_methods.3982006612:           "" => "OPTIONS"
  default_cache_behavior.0.allowed_methods.4024585617:           "" => "PUT"
  default_cache_behavior.0.cached_methods.#:                     "0" => "3"
  default_cache_behavior.0.cached_methods.1040875975:            "" => "GET"
  default_cache_behavior.0.cached_methods.1445840968:            "" => "HEAD"
  default_cache_behavior.0.cached_methods.3982006612:            "" => "OPTIONS"
  default_cache_behavior.0.compress:                             "" => "true"
  default_cache_behavior.0.default_ttl:                          "" => "86400"
  default_cache_behavior.0.forwarded_values.#:                   "0" => "1"
  default_cache_behavior.0.forwarded_values.0.cookies.#:         "0" => "1"
  default_cache_behavior.0.forwarded_values.0.cookies.0.forward: "" => "none"
  default_cache_behavior.0.forwarded_values.0.query_string:      "" => "false"
  default_cache_behavior.0.max_ttl:                              "" => "31536000"
  default_cache_behavior.0.min_ttl:                              "" => "0"
  default_cache_behavior.0.smooth_streaming:                     "" => "false"
  default_cache_behavior.0.target_origin_id:                     "" => "trynottoclick-website"
  default_cache_behavior.0.viewer_protocol_policy:               "" => "redirect-to-https"
  default_root_object:                                           "" => "index.html"
  domain_name:                                                   "" => "<computed>"
  enabled:                                                       "" => "true"
  etag:                                                          "" => "<computed>"
  hosted_zone_id:                                                "" => "<computed>"
  http_version:                                                  "" => "http2"
  in_progress_validation_batches:                                "" => "<computed>"
  is_ipv6_enabled:                                               "" => "true"
  last_modified_time:                                            "" => "<computed>"
  logging_config.#:                                              "0" => "1"
  logging_config.0.bucket:                                       "" => "trynottoclick-cloudfront-logs.s3.amazonaws.com"
  logging_config.0.include_cookies:                              "" => "false"
  logging_config.0.prefix:                                       "" => "website"
  origin.#:                                                      "0" => "1"
  origin.3673296045.custom_header.#:                             "0" => "0"
  origin.3673296045.custom_origin_config.#:                      "0" => "0"
  origin.3673296045.domain_name:                                 "" => "trynottoclick-website.s3.eu-west-1.amazonaws.com"
  origin.3673296045.origin_id:                                   "" => "trynottoclick-website"
  origin.3673296045.origin_path:                                 "" => ""
  origin.3673296045.s3_origin_config.#:                          "0" => "1"
  origin.3673296045.s3_origin_config.0.origin_access_identity:   "" => "origin-access-identity/cloudfront/ETXPDT4C5ZVK2"
  price_class:                                                   "" => "PriceClass_All"
  restrictions.#:                                                "0" => "1"
  restrictions.0.geo_restriction.#:                              "0" => "1"
  restrictions.0.geo_restriction.0.restriction_type:             "" => "none"
  retain_on_delete:                                              "" => "false"
  status:                                                        "" => "<computed>"
  tags.%:                                                        "0" => "2"
  tags.environment:                                              "" => "prod"
  tags.purpose:                                                  "" => "Website for a domain"
  viewer_certificate.#:                                          "0" => "1"
  viewer_certificate.0.acm_certificate_arn:                      "" => "arn:aws:acm:us-east-1:483560084512:certificate/22e266c6-e33f-481c-9f0e-ed6e52fe907a"
  viewer_certificate.0.cloudfront_default_certificate:           "" => "false"
  viewer_certificate.0.minimum_protocol_version:                 "" => "TLSv1.2_2018"
  viewer_certificate.0.ssl_support_method:                       "" => "sni-only"
module.redirect.aws_cloudfront_distribution.website: Still creating... (10s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (10s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (20s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (20s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (30s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (30s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (40s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (40s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (50s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (50s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (1m0s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (1m0s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (1m10s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (1m10s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (1m20s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (1m20s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (1m30s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (1m30s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (1m40s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (1m40s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (1m50s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (1m50s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (2m0s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (2m0s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (2m10s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (2m10s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (2m20s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (2m20s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (2m30s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (2m30s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (2m40s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (2m40s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (2m50s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (2m50s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (3m0s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (3m0s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (3m10s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (3m10s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (3m20s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (3m20s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (3m30s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (3m30s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (3m40s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (3m40s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (3m50s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (5m0s elapsed)
....
....
....
....
module.redirect.aws_cloudfront_distribution.website: Still creating... (19m20s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (19m20s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (19m30s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (19m30s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (19m40s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (19m40s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (19m50s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (19m50s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (20m0s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (20m0s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (20m10s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (20m10s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (20m20s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (20m20s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (20m30s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (20m30s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (20m40s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (20m40s elapsed)
module.redirect.aws_cloudfront_distribution.website: Still creating... (20m50s elapsed)
module.website.aws_cloudfront_distribution.website: Still creating... (20m50s elapsed)
module.website.aws_cloudfront_distribution.website: Creation complete after 20m59s (ID: E3TZYWSZZEA4DT)
module.redirect.aws_cloudfront_distribution.website: Creation complete after 20m59s (ID: ESCJ4VU4F2QQ)
aws_route53_record.website_dns: Creating...
  alias.#:                                 "" => "1"
  alias.3923531738.evaluate_target_health: "" => "true"
  alias.3923531738.name:                   "" => "d3frkc8n4rrklk.cloudfront.net"
  alias.3923531738.zone_id:                "" => "Z2FDTNDATAQYW2"
  allow_overwrite:                         "" => "<computed>"
  fqdn:                                    "" => "<computed>"
  name:                                    "" => "www.trynotto.click"
  type:                                    "" => "A"
  zone_id:                                 "" => "ZW7HC3OXIT5P9"
aws_route53_record.redirection_dns: Creating...
  alias.#:                                 "" => "1"
  alias.3963614513.evaluate_target_health: "" => "true"
  alias.3963614513.name:                   "" => "df88xsu4g5krr.cloudfront.net"
  alias.3963614513.zone_id:                "" => "Z2FDTNDATAQYW2"
  allow_overwrite:                         "" => "<computed>"
  fqdn:                                    "" => "<computed>"
  name:                                    "" => "trynotto.click"
  type:                                    "" => "A"
  zone_id:                                 "" => "ZW7HC3OXIT5P9"
aws_route53_record.website_dns: Still creating... (10s elapsed)
aws_route53_record.redirection_dns: Still creating... (10s elapsed)
aws_route53_record.website_dns: Still creating... (20s elapsed)
aws_route53_record.redirection_dns: Still creating... (20s elapsed)
aws_route53_record.website_dns: Still creating... (30s elapsed)
aws_route53_record.redirection_dns: Still creating... (30s elapsed)
aws_route53_record.redirection_dns: Creation complete after 33s (ID: ZW7HC3OXIT5P9_trynotto.click_A)
aws_route53_record.website_dns: Creation complete after 39s (ID: ZW7HC3OXIT5P9_www.trynotto.click_A)

Apply complete! Resources: 16 added, 0 changed, 0 destroyed.
```
