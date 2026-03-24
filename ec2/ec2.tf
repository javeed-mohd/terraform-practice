# Creation of EC2 Instance
resource "aws_instance" "example" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id] # Dependent on aws_security_group creation(Dependency Management)

  tags = {
    Name = "terraform-state-demo"
    Project = "roboshop"
  }
}

# Creation of Security Group (Change for taint)
resource "aws_security_group" "allow_tls" {
  name        = "allow-all-terraform-change" # this is for AWS account  # "allow tls" is for terraform reference
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = 0 # egress=outbound
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 0 # ingress=inbound
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-all-terraform"
  }

  # Terraform Lifecycle --> Lifecycle block is a meta-argument used inside a resource to control how Terraform manages that resource during creation, updates, and deletion.
  lifecycle {
    create_before_destroy = true
  }
}