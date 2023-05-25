#Resource to Create Key Pair
resource "aws_key_pair" "K3sArgoCD_KeyPair" {
  key_name   = var.key_pair_name
  public_key = var.public_key
}

resource "aws_instance" "K3sArgoCD_Instance"{
  ami           = "ami-0715c1897453cabd1"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.K3sArgoCD_KeyPair.key_name

   tags = {
    Name = "K3sArgoCD"
  }
}