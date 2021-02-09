# hpc-automation

This repository contains information and code to create an HPC cluster in Hetzner Cloud.

Four tools are used to build and manage the software and infrastructure:

## Packer (version 1.66)

Packer is used to create a snapshot in Hetzner Cloud. This snapshot forms the basis of the HPC node(s).

## Ansible (version 2.10.4)

Ansible is used to install and configure software. It is used by Packer as a provisioner and during HPC cluster
creation.

## Terraform (version 12.29)

Terraform is used to provision and manage the HPC cluster VM's.

## JQ

JQ is used to parse the json output from Terraform, 

## Google Cloud SDK (optional)

The Google Cloud SDK can be used by Terraform to save the state to a storage bucket. Regardless of whether
Google Cloud Storage (GCS) is used for remote state, remote state is a requirement, for the purposes of
continuity.

## Jenkins (optional)

Jenkins is used to manage the building of Packer snapshots, deploying an HPC cluster and then running jobs 
on the cluster. It is not a requirement to use Jenkins - it is possible to run all the jobs standalone. I have included
the DSL Jenkins code as an example.

# Instructions

## Building the snapshot

## Prerequisites

A Hetzner Cloud account. Create an account at https://www.hetzner.com/cloud

A Hetzner Cloud project. Once you have an account, create a new project.

A Hetzner Cloud token. Instructions here: https://docs.hetzner.cloud/#getting-started

An SSH keypair for the root user - add the private key to your project under "security".

An SSH keypair for the hpc user. The private and public key need to be encrypted using Ansible Vault.

See https://docs.ansible.com/ansible/latest/user_guide/vault.html#encrypting-existing-files

for instructions. Once the key pair has been encrypted, copy them to:

ansible/roles/copy-ssh-keypair/files/hpc

ansible/roles/copy-ssh-keypair/files/hpc.pub

replacing the existing files.

Keep a note of the password used to encrypt the files, it will be needed to decrypt them later.

## Using Packer to build the snapshot.

These instrctions assume Packer and Ansible are already installed on the host machine (i.e. your laptop).

In order to build the snapshot, three environment variables are required:

TOKEN which equals the api token.

LOCATION the Hetzner Cloud location.

SERVER_TYPE the Hetzner Cloud server type.

LOCATION can be one of hel1, nbg1 or fsn1

SERVER_TYPE: at the time of writing, the following server types are available:

![Server Types](../main/docs/server_types.png)

Example command:

cd hcloud/packer/create-hetzner-hpc-image-template

ansible-vault requires a file called 'password' that contains the vault password to decrypt the ssh keypair. 

packer build -var LOCATION=hel1 -var SERVER_TYPE=cx11 TOKEN=the_api_token create-hetzner-hpc-image-template.yml

Packer will create a temporary VM, install dependencies on that VM and then create a snapshot 

from the VM called "hpc-image-template" with a label "type: hpc-image-template" in your project.

This snapshot is then used by Terraform to create an HPC cluster.

