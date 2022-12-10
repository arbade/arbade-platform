include "root" {
    path = find_in_parent_folders()
} 

include "envcommon" {
    path = "${dirname(find_in_parent_folders())}/_envcommon/vpc/vpc.hcl"
}

inputs = {

    cidr = "10.220.0.0/16"

    ecs_subnets = ["10.220.0.0/24","10.220.1.0/24"] 
    public_subnets = ["10.220.2.0/24","10.220.3.0/24"]

}