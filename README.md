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

Jenskins is used to manage the building of Packer snapshots, deploying an HPC cluster and then running jobs 
on the cluster. It is not a requirement to use Jenkins - it is possible to run all the jobs standalone. I have included
the DSL Jenkins code as an example.

# Instructions

## Building the snapshot

## Prerequisites

A Hetzner Cloud account. Create an account at https://www.hetzner.com/cloud

A Hetzner Cloud project. Once you have an account, create a new project.

A Hetzner Cloud token. Instructions here: https://docs.hetzner.cloud/#getting-started

An SSH key for the root user - add this to you project under "security".

## Using Packer to build the snapshot.

These instrctions assume Packer and Ansible are already installed.

In order to build the snapshot, three environment variables are required:

TOKEN which equals the api token.
LOCATION the Hetzner Cloud location.
SERVER_TYPE the Hetzner Cloud server type.

