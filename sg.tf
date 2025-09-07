// Security group
resource "aws_security_group" "web_access_sg" {
  name        = "web-access-security-group"
  description = "Security group allowing SSH, HTTP, and custom web access"
  vpc_id      = aws_vpc.vpc1.id

  # SSH access (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow from anywhere (consider restricting this in production)
    description = "Allow SSH access"
  }

  # HTTP access (port 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP access"
  }

  # Custom web port access (port 8080)
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow custom web port access"
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name        = "web-access-sg"
    Environment = "development"
    ManagedBy   = "terraform"
  }
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.web_access_sg.id
}

output "security_group_name" {
  description = "The name of the security group"
  value       = aws_security_group.web_access_sg.name
}