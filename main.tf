terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.0" 
    }
  }

  required_version = ">= 0.12"  
}

provider "digitalocean" {
  token = var.digitalocean_token  
}


variable "ssh_key_id" {
  description = "The ID of the SSH key to be used for the droplet"
  type        = string
}

variable "digitalocean_token" {
  description = "The API token for DigitalOcean"
  type        = string
}

variable "domain_name" {
  description = "The domain name to be used for the DNS record."
  type        = string
}



resource "digitalocean_droplet" "my_droplet" {
  image  = "ubuntu-20-04-x64"  
  name   = "my-droplet"
  region = "nyc3"               
  size   = "s-1vcpu-1gb"        
  ssh_keys = [
    var.ssh_key_id               
  ]
}


resource "digitalocean_record" "my_record" {
  domain = var.domain_name       
  name   = "my-droplet"        
  type   = "A"                  
  value  = digitalocean_droplet.my_droplet.ipv4_address  
}


output "droplet_ip" {
  value = digitalocean_droplet.my_droplet.ipv4_address
}
