
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

    A[📁 Resource Group] --> B[🌐 Virtual Network (VNet)]
    
    B --> C1[🔹 Subnet: VM Subnet]
    B --> C2[🔹 Subnet: AKS Subnet]
    B --> C3[🔹 Subnet: Bastion Subnet]

    %% VM Components
    C1 --> D1[🔌 Network Interface (NIC)]
    D1 --> E1[🌍 Public IP]
    D1 --> F1[🛡️ Network Security Group]
    D1 --> G1[💻 Virtual Machine (Jump VM)]

    %% Bastion
    C3 --> H[🛡️ Azure Bastion]

    %% Platform Resources
    A --> I[💾 Storage Account]
    A --> J[🔐 Key Vault (Secrets/Credentials)]
    A --> K[📦 Azure Container Registry (ACR)]

    %% AKS
    C2 --> L[☸️ AKS Cluster]
    L --> M[⚖️ Load Balancer (External / Internal)]

    %% SQL
    A --> S[🗄️ SQL Server]
    S --> SD[📘 SQL Database]

