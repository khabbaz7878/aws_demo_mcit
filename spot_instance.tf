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
  ami                  = "ami-0b3e57ee3b63dd76b" # amazon linux 
}
