# Terraform QuickStart

This sample project create servers on DigitalOcean via Terraform.
 
Terraform is an infrastructure compositor like CloudFormation or Heat, supporting
various infrastructure providers including Amazon, VirtuaBox, ... 

The files are:

  - example-server.tf           # server configuration and setup
  - digitalocean-provider.tf    # provider configuration
  - terraform.py                # Python script to create an ansible inventory
                                    out of terraform.
                                    
## Running

Get the MD5 fingerprint of your ssh key

```
ssh-keygen -lf ~/.ssh/id_rsa.pub -E md5
```

Popolate your terraform.tfvars
```
cat >> terraform.tfvars <<EOF
pub_key = "~/.ssh/id_rsa.pub"
pvt_key = "~/.ssh/id_rsa"
ssh_fingerprint = "36:51:88:b9:d0:2f:7f:7c:c2:f3:38:0f:a1:9e:7a:e1"

EOF
```

Check the deployment plan
```
export DIGITALOCEAN_TOKEN="YOUR_TOKEN_HERE"
terraform plan
```

Deploy the infrastructure
```
terraform apply
```


Destroy the infrastructure
```
terraform destroy --force
```

## How does it work?

Terraform reads *.tf and creates an execution plan containing all resources:

  - instances
  - volumes
  - networks
  - ..

Further resources (eg. openstack volumes|floating_ip, digitalocean droplets, docker containers, ..) 
can be defined via plugins.

At the end of every deployment cycle, terraform updates the `terraform.tstate` state file (which may
be stored on s3 or on shared storage) describing the actual infrastructure.

Upon configuration changes, terraform creates and shows a new execution plan,
that you can eventually apply.

As there's no ansible provisioner, a terraform.py script can be used
to extract an inventory file from a `terraform.tstate`.