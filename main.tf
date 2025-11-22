provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "k8s"{
    ami = "ami-04f34746e5e1ec0fe"
    instance_type = "c7i-flex.large"
    key_name = "k8s"
    vpc_security_group_ids = [aws_security_group.k8s_sg.id]
    root_block_device {
        volume_size = 30
        volume_type = "gp3"
    }

}

resource "aws_security_group" "k8s_sg" {
  name        = "k8s-kind-sg"
  description = "Allow SSH, HTTP, and NodePorts"

  # SSH Access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP Access (App)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # NodePorts Range (For ArgoCD, Grafana access)
  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# 3. Output the Public IP
output "ec2_public_ip" {
  value = aws_instance.k8s.public_ip
}