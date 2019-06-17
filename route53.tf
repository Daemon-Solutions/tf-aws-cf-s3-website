resource "aws_route53_record" "dns_record" {
  count   = var.enabled ? length(var.route53_alias_records) : 0
  name    = var.route53_alias_records[count.index]["name"]
  zone_id = var.route53_alias_records[count.index]["zone_id"]
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.website[0].domain_name
    zone_id                = aws_cloudfront_distribution.website[0].hosted_zone_id
    evaluate_target_health = true
  }
}

