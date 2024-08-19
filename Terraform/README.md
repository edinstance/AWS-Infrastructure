# Terraform

This folder contains the [Terraform](https://www.terraform.io) config used to create AWS Infrastructure. Static code analysis tools are being used to check the format of the config. To run them install [TFLint](https://github.com/terraform-linters/tflint)


## Linting 

Once [TFLint](https://github.com/terraform-linters/tflint) is installed move into this directory and run this command ```tflint --recursive```. The config for TFLint is set up in the [.tflint.hcl](.tflint.hcl) file. 
