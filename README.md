# Example Terraform Configuration for BigDevBox

[BigDevBox](https://bigdevbox.com) includes commands to initialize an [IAM role](https://bigdevbox.com/docs/#CLIUsage-InitIAMRole) and [VPCs](https://bigdevbox.com/docs/#CLIUsage-InitVPC) but your organization may manage it's existing AWS infrastructure via [Terraform](https://www.terraform.io/) instead. The following example configuration should allow you to setup the required resources and customize to your needs.

## Getting Started

1. [Install Terraform](https://www.terraform.io/downloads.html).
2. Run `terraform init` to install required AWS modules.
3. Adjust `main.tf` and `vpc.tf` to include the region(s) that you'd like to configure as well as the valid zones in those regions.
4. Run `terraform apply`.

Note that the .tfstate files are ignored in this git repository. You may be unable to modify these resources after the fact if you do not save them.
