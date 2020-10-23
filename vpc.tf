module "bigdevbox_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name            = "bigdevbox"
  description     = "Allows all inbound traffic to bigdevbox instances (local firewalls provide protection instead)"
  vpc_id          = module.bigdevbox_vpc.vpc_id
  use_name_prefix = false

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["all-all"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
}

module "bigdevbox_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "bigdevbox-terraform"

  cidr = "10.255.0.0/20"

  azs            = ["us-east-2a", "us-east-2b", "us-east-2c"]
  public_subnets = ["10.255.0.0/24", "10.255.1.0/24", "10.255.2.0/24"]

  enable_ipv6        = false
  enable_nat_gateway = false
  single_nat_gateway = false

  public_subnet_tags = {
    Name = "bigdevbox-vpc-terraform"
  }

  vpc_tags = {
    Name = "bigdevbox-terraform"
  }
}
