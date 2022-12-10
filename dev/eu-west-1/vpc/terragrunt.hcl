include "root" {
    path = find_in_parent_folders()
} 

include "envcommon" {
    path = "${dirname(find_in_parent_folders())}/_envcommon/vpc/vpc.hcl"
}

inputs = {

    cidr = "10.100.0.0/16"

    ecs_subnets = ["10.100.0.0/24","10.100.1.0/24"] 
    public_subnets = ["10.100.2.0/24","10.100.3.0/24"]

}