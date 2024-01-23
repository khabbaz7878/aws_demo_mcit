# Request a spot instance at $0.03
resource "aws_spot_instance_request" "cheap_worker" {
  ami           = "ami-1234"
  spot_price    = "0.03"
  instance_type = "c4.xlarge"

  tags = {
    Name = "CheapWorker"
  }
}
resource "aws_spot_instance_request" "public" {
  ami                  = "ami-0b3e57ee3b63dd76b" # amazon linux 2 ami
  spot_price           = "0.03"
  instance_type        = "t3a.nano"
  subnet_id            = module.vpc.public_subnets[0]
  iam_instance_profile = aws_iam_instance_profile.main.id
}

resource "aws_spot_instance_request" "spot1" {
  ami                    = "ami-02701bcdc5509e57b"
  spot_price             = "0.016"
  instance_type          = "t2.micro"
  spot_type              = "one-time"
  wait_for_fulfillment   = "true"
}
