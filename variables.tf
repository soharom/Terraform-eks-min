variable "access_key" {
  description = "Access key to AWS"
  sensitive   = true

}

variable "secret_key" {
  description = "Secret key to AWS console"
  sensitive   = true
}
variable "region" {
  description = "Region to where you want to install the cluster"
  type = string
  
}
variable "sg_name" {
  description = " Security group name yo be created and associated  to  nodes "
  type = string

}
variable "core_network_arn" {
  description = "The ARN of the Core Network."
  type        = string
}