data "aws_eks_cluster" "example" {
    name = "demo"
    
  
}

locals {
  kubeconfig = templatefile("templates/kubeconfig.tpl", {
    kubeconfig_name                   = "any"
    endpoint                          = data.aws_eks_cluster.example.endpoint
    cluster_auth_base64               = data.aws_eks_cluster.example.certificate_authority[0].data
    aws_authenticator_command         = "aws-iam-authenticator"
    aws_authenticator_command_args    = ["token", "-i", data.aws_eks_cluster.example.name]
    aws_authenticator_additional_args = []
    aws_authenticator_env_variables   = {}
  })
}

output "kubeconfig" {
  value = local.kubeconfig
}
