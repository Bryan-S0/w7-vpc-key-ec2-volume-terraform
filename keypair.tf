//create key pair
resource "tls_private_key" "kp" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
resource "aws_key_pair" "kp1" {
  key_name   = "T_KP"
  public_key = tls_private_key.kp.public_key_openssh
}
resource "local_file" "privatekey" {
  filename        = "Terraformkey.pem"
  file_permission = 0400
  content         = tls_private_key.kp.private_key_openssh
}