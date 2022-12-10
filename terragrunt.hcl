locals {

  # Automatically load account-level variables
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))

  # Automatically load region-level variables
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))

    # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract the variables we need for easy access
  env = local.environment_vars.inputs.env
  region   = local.region_vars.inputs.region
  assume_role_arn = local.account_vars.inputs.assume_role_arn
 #s3_bucket_name = local.account_vars.inputs.s3_bucket_name
}

generate "provider" {
  path = "provider.tf"
  if_exists = "skip"
  contents = <<EOF
provider "aws" {
  default_tags {
    tags = {
      Environment = "${local.environment_vars.inputs.env}"
      Terraform = "true"
    }
  }
  assume_role {
    role_arn = "${local.assume_role_arn}"
  }
  region = "${local.region}"
}
EOF
}


inputs = merge(
  local.account_vars.inputs,
  local.region_vars.inputs,
  local.environment_vars.inputs,
)