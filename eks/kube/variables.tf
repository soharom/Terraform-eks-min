variable "access_key" {
  description = "Access key to AWS"
  sensitive   = true

}

variable "secret_key" {
  description = "Secret key to AWS console"
  sensitive   = true
}

variable "sg_name" {
  type = string

}
