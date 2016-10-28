# Docker Datacenter Vagrantfile with Ansible.

This Vagrant+Ansible file configure a docker datacenter cluster on DigitalOcean.

Vagrant:

  - deploys the machines on digitalocean
  - autogenerates an inventory file
  - runs ansible

The playbook roles can be taken from ansible-galaxy.


## Setup and Install

To install ansible-galaxy roles and vagrant-digitalocean run

    vagrant up --provider=digital_ocean

In case of error during ansible setup, just rerun provisioning via vagrant

    vagrant provisioning

## Configure

Put your digitalocean token and your elastic requirements in the Vagrantfile, including:

  - image size
  - zone


## Troubleshoot

Run vagrant with

    vagrant up --debug

