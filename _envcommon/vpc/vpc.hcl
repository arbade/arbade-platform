terraform {
  source = "git::git@github.com:arbade/arbade-iac-platform.git//terraform-aws-vpc"
  #source = "git::git@github.com:arbade/arbade-iac-platform.git//terraform-aws-vpc?ref=vpc-fix"
}

locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))  


  # Extract out common variables for reuse
  env = local.environment_vars.inputs.env
  region = local.region_vars.inputs.region


}

# Indicate the input values to use for the variables of the module.
inputs = {

  name = "${local.env}_vpc_arbade"
  azs             = ["${local.region}a", "${local.region}b"]
  create_igw = true

  create_database_subnet_group = false
  create_cache_subnet_group = false

  ecs_dedicated_network_acl = true
  create_ecs_subnet_route_table = true
  

  enable_dns_support   = true
  enable_dns_hostnames = true

  enable_nat_gateway = true
  single_nat_gateway = false
  one_nat_gateway_per_az = true

  create_ecs_nat_gateway_route = true
  create_database_nat_gateway_route = true


}