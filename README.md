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

### 📊 Architecture Diagram (Mermaid — GitHub Compatible)
graph TD;

    A[📁 Resource Group] --> B[🌐 Virtual Network]

    B --> C1[🔹 Subnet - VM Subnet]
    B --> C2[🔹 Subnet - AKS Subnet]
    B --> C3[🔹 Subnet - Bastion Subnet]

    %% VM Components
    C1 --> D1[🔌 NIC]
    D1 --> F1[🛡️ NSG]
    D1 --> G1[💻 Linux Virtual Machine]
    D1 --> E1[🌍 Public IP]

    %% Bastion
    C3 --> H[🛡️ Azure Bastion]

    %% Storage
    A --> I[💾 Storage Account]

    %% Key Vault
    A --> J[🔐 Azure Key Vault]

    %% Container Registry
    A --> K[📦 Azure Container Registry]

    %% AKS
    C2 --> L[☸️ AKS Cluster]
    L --> M[⚖️ AKS Load Balancer]

    %% SQL
    A --> S[🗄️ Azure SQL Server]


