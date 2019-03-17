# Kyle_Challenge

SRE Challenge application project as defined in `SRE_Challenge.pdf`

## Infrastructure

The webserver is currently running at https://ec2-54-86-80-103.compute-1.amazonaws.com

A simple secured web server that displays a simple Hello World page. Uses Ansible to configure the web server, Packer to create an AMI of the configured server, and Terraform to deploy the server from the AMI and all supporting infrastructure.

### Running

Environment variables `AWS_ACCESS_KEY` and `AWS_SECRET_ACCESS_KEY` must be set to allow aws auth. Navigate to the infrastructure directory. Run `make bake` to build an AMI. Note the AMI ID and set it in `default.tfvars` (you may also set the key pair name in that file). Run `make plan` to plan the terraform run, and then `make apply` to apply the plan you created.

## Coding

A python script that validates credit card numbers
