# 🚀 Azure Infrastructure – High-Level + Low-Level Design

This repository contains a complete Azure Infrastructure deployment using Terraform Modular Architecture.
The design follows production-grade standards, secure patterns, and enterprise naming conventions.

# 📘 1. High-Level Architecture (HLD)
🏗 Azure End-to-End Infrastructure Overview

The following resources are deployed:

Resource Group

Virtual Network & Subnets

Network Security Groups

Public IP

Network Interface Card

Linux Virtual Machine

Azure Bastion

Azure Storage Account

Azure Key Vault

Azure Container Registry (ACR)

Azure Kubernetes Service (AKS)

Load Balancer (AKS Internal/External)

Azure SQL Server + Database

2. Low-Level Design (LLD)
✔ Terraform Folder Structure (Production Ready)

 /Terraform
│── main.tf
│── variables.tf
│── outputs.tf
│── provider.tf
│── terraform.tfvars
│── backend.tf
│
├── /modules
│   ├── /RG
│   │    ├── main.tf
│   │    ├── variables.tf
│   │    ├── outputs.tf
│   │
│   ├── /VNET
│   ├── /SUBNET
│   ├── /PIP
│   ├── /NIC
│   ├── /NSG
│   ├── /VM
│   ├── /BASTION
│   ├── /STORAGE
│   ├── /KEYVAULT
│   ├── /ACR
│   ├── /AKS
│   ├── /AZURE_SQL_SERVER
│
└── /environment
    ├── dev.tfvars
    ├── test.tfvars
    └── prod.tfvars
# 📘 3. Naming Convention (Industry Standard)
| Resource       | Naming Pattern     | Example        |
| -------------- | ------------------ | -------------- |
| Resource Group | `<project>-rg`     | `app-dev-rg`   |
| VNet           | `<project>-vnet`   | `app-dev-vnet` |
| Subnet         | `<component>-snet` | `vm-snet`      |
| VM             | `<project>-vm`     | `app-dev-vm01` |
| NIC            | `nic-<vm name>`    | `nic-appvm01`  |
| NSG            | `<project>-nsg`    | `app-dev-nsg`  |
| ACR            | `<project>acr`     | `appacr`       |
| AKS            | `<project>-aks`    | `app-dev-aks`  |
| Storage        | `st<project>`      | `stappdev01`   |
| Key Vault      | `kv-<project>`     | `kv-appdev`    |

 # 📘 4. Terraform Modules Logic (Clear Explanation)
✔ Resource Group Module

Creates a single centralized RG for all resources.

✔ VNet Module

Deploys main VNet with 3 subnets:

VM Subnet

AKS Subnet

Bastion Subnet

✔ NIC Module

Creates NIC and attaches:

Subnet

NSG

Public IP

✔ NSG Module

Defines inbound/outbound VM rules.

✔ VM Module

Creates Ubuntu VM with:

NIC

Public IP

NSG

Admin Credentials from Key Vault

✔ Bastion Module

Secure remote login to VM (without exposing SSH).

✔ ACR Module

Stores container images to be pulled by AKS.

✔ AKS Module

Creates AKS Cluster with:

Node Pool

ACR Integration

Load Balancer

✔ SQL Server + Database

Deploys managed SQL Database.


