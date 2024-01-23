# Request a spot instance at $0.03
resource "aws_spot_instance_request" "spot1" {
  ami           = "ami-1234"
  spot_price    = "0.03"
  instance_type = "c4.xlarge"

  tags = {
    Name = "Spotinstance"
  }
}

resource "aws_spot_instance_request" "spot2" {
  ami                    = "ami-02701bcdc5509e57b"
  spot_price             = "0.016"
  instance_type          = "t2.micro"
  spot_type              = "one-time"
  wait_for_fulfillment   = "true"

  tags = {
    Name = "SpotInstanceTwo"
  }
}
resource "aws_spot_instance_request" "spot3" {
  ami           = "ami-0c94855ba95c574c8" # Amazon Linux 2 AMI in us-east-1
  instance_type = "t3.micro"
  spot_price    = "0.02"
  availability_zone = "us-east-1a"

  tags = {
    Name = "SpotInstanceThree"
  }
}
