module "eks" {
    source = "./eks"
    sg_name =  var.sg_name
    core_network_arn  = var.core_network_arn
  
}