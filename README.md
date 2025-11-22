**Terraform AWS EC2 Deployment (K8s Node) 🚀**

This project provisions an AWS EC2 instance and security group using Terraform, designed for running Kubernetes tools such as Kind, ArgoCD, and Grafana.

**📁 Project Structure**
├── main.tf # Contains provider, EC2 instance, and security group definitions

├── README.md # Project documentation



**⚙️ What This Terraform Setup Does**

-Creates an EC2 instance using the specified AMI and instance type.

-Attaches a Security Group allowing:

-SSH access (22)

-HTTP access (80)

-NodePort range (30000–32767) for Kubernetes services

-Automatically outputs the EC2 public IP after creation.

**📄 License**

This project is open-source and free to use.
