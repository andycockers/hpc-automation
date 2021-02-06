# hpc-automation

This repository contains information and code to create an HPC cluster in Hetzner Cloud.

Four tools are used to build and manage the software and infrastructure:

## Packer

Packer is used to create a snapshot in Hetzner Cloud. This snapshot forms the basis of the HPC node(s).

## Ansible

Ansible is used to install and configure software. It is used by Packer as a provisioner and during HPC cluster
creation.

## Terraform

Terraform is used to provision and manage the HPC cluster.

## Jenkins

