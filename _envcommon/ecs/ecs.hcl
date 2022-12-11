

terraform {
  source = "git::git@github.com:arbade/arbade-iac-platform.git//platform-aws-ecs"
}

locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))



}

inputs = {
    
}