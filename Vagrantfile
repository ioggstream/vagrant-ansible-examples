# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Define machine specs
boxes = [
    { :name => "e1" },
    { :name => "e2" },
]

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # 
  # Provision my servers on digital_ocean using the given pk.
  config.vm.box = "digital_ocean"
  config.ssh.private_key_path = "~/.ssh/id_rsa_do"

  # Disable synced folder https://github.com/devopsgroup-io/vagrant-digitalocean/issues/41
  config.vm.synced_folder '.', '/vagrant', :disabled => true

  #  Get the token from digitalocean web panel, then
  #   gather image, region and size names using:
  #   vagrant -list [images|regions|sizes] $TOKEN 
  config.vm.provider "digital_ocean" do |ocean|
    ocean.token = ENV['token']
    ocean.image = "centos-7-x64"
    ocean.region = "fra1"
    ocean.size = "512mb"
  end

  # Create multiple machines using the boxes definition.
  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]
    end
  end

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "vvv"
    ansible.playbook = "provisioning/playbook.yml"
    
#    ansible.inventory_path = "provisioning/inventory"
  end

end
