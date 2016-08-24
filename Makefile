#
# Setup and deploy an es cluster on digitalocean
#
setup:
	sudo ansible-galaxy install devops.elasticsearch
	vagrant plugin list | grep -q digitalocean || vagrant plugin install vagrant-digitalocean

