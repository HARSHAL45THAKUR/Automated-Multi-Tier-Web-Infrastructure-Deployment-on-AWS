resource "aws_instance" "app" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private.id
  associate_public_ip_address = false
  key_name = "your-key"
  security_groups = [aws_security_group.ec2_sg.name]
  user_data = file("../scripts/deploy.sh")
}