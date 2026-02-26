resource "aws_route53_record" "www" {
  for_each = aws_instance.example
  zone_id  = var.zone_id
  # Interpolation is inserting dynamic values (variables, resource attributes, functions) into strings.
  name     = "${each.key}.${var.domain_name}" # mongodb.devopsdaws.online
  type     = "A"
  ttl      = 1
  records  = [each.value.private_ip]
  allow_overwrite = true
}