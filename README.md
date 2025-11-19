
# 📘 High-Level Design (HLD) – Azure Infrastructure
## 🏗️ Architecture Overview

Ye architecture Azure me end-to-end Infrastructure define karta hai jisme following resources deploy honge:

Resource Group

Virtual Network

Subnets

Network Security Group

Public IP

Network Interface

Virtual Machine (Jump/Bastion Alternative)

Azure Bastion

Azure Storage Account

Azure Container Registry (ACR)

Azure Kubernetes Service (AKS)

graph TD;

    A[Resource Group] --> B[VNet]
    B --> C1[Subnet - VM Subnet]
    B --> C2[Subnet - AKS Subnet]
    B --> C3[Subnet - Bastion Subnet]

    C1 --> D1[NIC]
    D1 --> E1[Public IP]
    D1 --> F1[NSG]
    D1 --> G1[Virtual Machine]

    C3 --> H[Bastion]

    A --> I[Storage Account]

    A --> J[Azure Key Vault]

    A --> K[Azure Container Registry]

    C2 --> L[AKS Cluster]
    L --> M[Load Balancer]

    K --> L
    J --> L


Load Balancer (Internal/External)

Azure Key Vault
