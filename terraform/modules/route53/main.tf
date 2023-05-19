# ---------------------------------------------------------------------------
# Route53
# ---------------------------------------------------------------------------

# resource "aws_route_53" "public_website" {
#   name = var.domain_name
# }
resource "aws_route53_zone" "this" {
  name = var.domain_name
}

resource "aws_route53_record" "domain_record" {
  zone_id = aws_route53_zone.this.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.cloudfront.domain_name
    zone_id                = var.cloudfront.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.this.zone_id
  name    = "www.${var.domain_name}"
  type    = "CNAME"
  ttl     = 900

  records = ["${var.domain_name}"]

  depends_on = [aws_route53_record.domain_record]
}

