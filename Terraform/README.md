# Terraform

This folder contains the [Terraform](https://www.terraform.io) config used to create AWS Infrastructure. Static code analysis tools are being used to check the format and security of the config. To run them install [TFLint](https://github.com/terraform-linters/tflint) and [Trivy](https://trivy.dev). 


## Linting 

Once [TFLint](https://github.com/terraform-linters/tflint) is installed move into this directory and run this command ```tflint --recursive```. The config for TFLint is set up in the [.tflint.hcl](.tflint.hcl) file. 


## Securtity 

Once [Trivy](https://trivy.dev) is installed move into this directory and run this command ```trivy config .``.


## Current Infrastructure 

This is the current infrastructure that the terraform creates.

To access the private ec2 you need to ssh into the public ec2 and then ssh into the private ec2. 

![Infrastructure diagram](https://app.eraser.io/workspace/OYKeaatA9U4gBcEuzkc3?elements=kpDRAM6jQmtmGS0yyT0BhA)