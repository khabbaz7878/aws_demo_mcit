# Create Elastic IP
resource "aws_eip" "bastion_eip" {
  vpc = true
  
  tags = {
    Name = "bastion-eip"
  }
}

# Create EC2 instance for bastion host
resource "aws_instance" "bastion" {
  ami           = "ami-0abcdef1234567" # AMI for bastion 
  instance_type = "t2.micro"
  
  subnet_id              = aws_subnet.public_a.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "bastion"
  }
}

# Associate EIP with bastion instance
resource "aws_eip_association" "bastion_eip_assoc" {
  instance_id   = aws_instance.bastion.id
  allocation_id = aws_eip.bastion_eip.id
}

# Security group for bastion host
resource "aws_security_group" "bastion_sg" {
  name        = "bastion_sg"
  description = "Allow inbound SSH traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0 
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
