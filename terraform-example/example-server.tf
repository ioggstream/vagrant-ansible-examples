#
# Terraform creation of a digitalocean droplet. Run with:
#
#   #export DIGITALOCEAN_TOKEN=YOUR_TOKEN_HERE
#   #terraform apply
#

resource "digitalocean_droplet" "web_mydomain" {
    # Image/Flavor setup
	image = "ubuntu-14-04-x64"
	region = "nyc2"
	size = "512mb"
	private_networking = true

	# Instance count and name via templating.
    count = 1
	name = "web-${count.index}.mydomain.com"

	# The fingerprint is used to identify the required key to install
	#  on the servers.
	ssh_keys = [
	 	"${var.ssh_fingerprint}"
	]

	# Terraform connects to the hosts via this pvt key.
	connection {
		user = "root"
		type = "ssh"
		key_file = "${var.pvt_key}"
		timeout = "1m"
	}

    # Provision via ansible. Terraform doesn't have an ansible provisioner, so
    #   we need a custom python script provided by cisco.
    provisioner "local-exec" {
        command = "TERRAFORM_STATE_ROOT=. ansible -i terraform.py -m ping all"
    }
}

