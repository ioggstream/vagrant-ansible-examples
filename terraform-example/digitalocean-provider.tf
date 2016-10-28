# Export your digitalocean token to DIGITALOCEAN_TOKEN
variable "pub_key" {}           #Public Key to be installed in your DigitalOcean server
variable "pvt_key" {}           #Private Key Terraform will use to connect to your new server
variable "ssh_fingerprint" {}   #SSH Fingerprint

provider "digitalocean" {
#   token = "${var.do_token}"   # eventually set your token here.
}

