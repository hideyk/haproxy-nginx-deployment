# Automating two-tier infrastructure provisioning through Ansible & Terraform

## Technology stack
AWS | Terraform | Ansible | Nginx | HAProxy
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
<img src="images/aws.png" width="100">  |  <img src="images/terraform.png" width="100">  | <img src="images/ansible.png" width="100"> | <img src="images/nginx.png" width="100"> | <img src="images/haproxy.png" width="100"> 

## Motivation
As part of interview process with Alation...

## Requirements
This guide assumes the user is running a WindowsOS with the following software installed and configured:

| Software  | Version |
| ------------- | ------------- |
| Git CLI  | >= 2.3 |
| Terraform  | >= 0.14 |
| AWS CLI | >= 2.0 (**with credentials configured**) |


For Git CLI installation, [this guide](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) will be helpful.

For Terraform, there are [various ways to install the binary on Windows](https://learn.hashicorp.com/tutorials/terraform/install-cli). For simplicity sake, you can download the updated zipped package and add the unzipped binary's path to your `PATH`.

For AWS CLI, you may follow this [guide to install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html) using the MSI installer.

## Infrastructure set-up
```bash
git clone https://github.com/hideyukikanazawa/haproxy-nginx-deployment.git
cd haproxy-nginx-deployment/terraform
terraform init
terraform plan
terraform apply -auto-approve # Only run this when you're sure of provisioning infrastructure
```

Dynamic inventory hosts: https://stackoverflow.com/questions/45489534/best-way-currently-to-create-an-ansible-inventory-from-terraform