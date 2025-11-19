
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

Load Balancer (Internal/External)

Azure Key Vault

SQL Server

SQL Database

graph TD
    A[📁 Resource Group] --> B[🌐 VNet]

    B --> C1[🔹 VM Subnet]
    B --> C2[🔹 AKS Subnet]
    B --> C3[🔹 Bastion Subnet]

    %% VM
    C1 --> D1[🔌 NIC]
    D1 --> F1[🛡️ NSG]
    D1 --> G1[💻 Virtual Machine]
    D1 --> E1[🌍 Public IP]

    %% Bastion
    C3 --> H[🛡️ Azure Bastion]

    %% Other RG resources
    A --> I[💾 Storage Account]
    A --> J[🔐 Key Vault]
    A --> K[📦 Azure Container Registry]

    %% AKS
    C2 --> L[☸️ AKS Cluster]
    L --> M[⚖️ Load Balancer]

    %% SQL
    A --> S[🗄️ SQL Server]

  

