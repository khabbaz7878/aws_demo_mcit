resource "aws_eip" "bastion" {
  vpc = true
}

resource "aws_instance" "bastion" {
  # ... other instance configuration ...

  # Associate the EIP with the bastion host
  associate_public_ip_address = true
  # If you want to specify the EIP explicitly, use the following line instead:
  # public_ip = aws_eip.bastion.id
}

# Optionally, you can also create a Route53 DNS record for the bastion host
resource "aws_route53_record" "bastion" {
  zone_id = aws_route53_zone.example.zone_id
  name    = "bastion.example.com"
  type    = "A"
  ttl     = "3600"
  records = [aws_eip.bastion.public_ip]
}
