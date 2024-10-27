# variables.tf
variable "do_token" {
  type        = string
  description = "DigitalOcean API token"
}

variable "ssh_key_fingerprint" {
  type        = string
  description = "SSH key fingerprint"
}

variable "domain" {
  type        = string
  description = "Domain name for DNS"
}