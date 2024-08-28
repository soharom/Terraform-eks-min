## EKS base cluster
This terraform scripte aims to create base EKS cluster in aws , there only one module  , in the module there is confguration of all needed resources :
 * Network 
    * IGW
    * NAT Gatway 
    * Routes
    * subnets
    * VPC
 * Cluster
   * EKS Cluster
   * IAM role
   * Node Group 

## Usage 

To use the scipte just you need to fill the variables in 'terraform.tfvars' and run :

```bash
terraform init
```
After  run :

```bash
terraform plan 
```

Finally :

```bash
terraform apply 
```
