🏗️ Architecture Overview

This architecture is designed to support cloud-native workloads, including VM-based admin access, AKS container platforms, secure DevOps pipelines, and a scalable database layer.

The system ensures:
✔ Zero-trust secure access
✔ Scalable compute with AKS
✔ Secure secret management
✔ CI/CD-ready microservices architecture
✔ Isolated subnet-level security
✔ Terraform modular & reusable infra

🧩 Infrastructure Components
Compute

💻 Virtual Machine (Jump/Worker VM)

🛡️ Azure Bastion (Secure login)

☸️ Azure Kubernetes Service (AKS)

Networking

🌐 VNet

🔹 VM Subnet

🔹 AKS Subnet

🔹 Bastion Subnet

🌍 Public IP

🔌 NIC

🛡️ NSG

Storage & Database

💾 Storage Account

🗄️ Azure SQL Server + SQL Database

Security

🔐 Key Vault (Secrets, Keys, Certificates)

DevOps Platform

📦 Azure Container Registry (ACR) (Docker Images)

🔄 Azure DevOps / GitHub Actions CI/CD

🧠 Why This Architecture? (Logic + Best Practices Explanation)
🔒 Security First Approach

No VM has a Public IP (SSH/RDP only via Bastion)

Key Vault stores DB passwords, SPN secrets, AKS credentials

NSG restricts traffic

AKS → ACR authenticated via Managed Identity

🧱 Network Segmentation

VM Subnet for admin/jump host

AKS Subnet for Kubernetes Node Pools

Bastion Subnet for Azure Bastion isolation

☸️ Production-Grade AKS Cluster

Integrated with ACR for container images

Supports Load Balancer (internal/external)

Supports Blue/Green or Canary Deployments

📦 Image Lifecycle

DevOps pipelines build + push Docker images → ACR → AKS pulls → Deployment rollout

🗄️ SQL Server for Application Data

Central relational DB

Can be accessed using private endpoints

## 📘 Naming Conventions (Production Standard)
## 📘 Naming Conventions (Production Standard)

| Resource Type   | Naming Standard   | Example          |
|-----------------|-------------------|------------------|
| Resource Group  | `rg-<app>-prod`   | rg-webapp-prod   |
| VNet            | `vnet-<app>-prod` | vnet-webapp-prod |
| Subnet          | `snet-<role>`     | snet-aks         |
| VM              | `vm-<role>-01`    | vm-jump-01       |
| NIC             | `nic-<vm>`        | nic-jump01       |
| NSG             | `nsg-<role>`      | nsg-vm           |
| Storage Account | `st<app>prod`     | stwebappprod     |
| ACR             | `<app>acr`        | webappacr        |
| AKS             | `aks-<app>-prod`  | aks-webapp-prod  |
| SQL Server      | `sql-<app>-prod`  | sql-webapp-prod  |

🚀 CI/CD Pipeline Strategy (Infra + Application)

This project uses a secure, production-grade CI/CD workflow leveraging both GitHub Actions / Azure DevOps, designed to ensure:

✔ Zero vulnerabilities
✔ Fully automated infrastructure deployments
✔ Secure application container lifecycle
✔ Continuous monitoring & observability

This pipeline setup follows DevSecOps best practices.
| Tool           | Purpose                                     |
| -------------- | ------------------------------------------- |
| **TFLint**     | Terraform linting & coding standards        |
| **TruffleHog** | Detects hardcoded secrets in TF code        |
| **tfsec**      | Static code analysis for Terraform security |
| **Checkov**    | Cloud misconfiguration scanning             |


Infrastructure Pipeline Flow (GitHub Actions / Azure DevOps)
📌 Stage 1 — Pre-Commit Validation
    ✔ Terraform fmt
    ✔ Terraform validate
    ✔ TFLint (linting)
    ✔ Trufflehog (secret scanning)

📌 Stage 2 — Security Scan
    ✔ tfsec for IaC vulnerabilities
    ✔ Checkov full infrastructure compliance check
    ✔ Policy-as-code validation (if enabled)

📌 Stage 3 — Terraform Plan
    ✔ Generate execution plan
    ✔ Store plan artifact
    ✔ Requires manual approval for production

📌 Stage 4 — Terraform Apply
    ✔ Deploy modular infrastructure
    ✔ Push state to remote backend (Azure Storage)

    
🐳 2. Application Build & Deployment Pipeline (DevOps)
Application is containerized and deployed into AKS using enterprise-grade CI/CD.
🛡️ Security Tools Integrated for Application
Tool	Purpose
Trivy	Vulnerability scanning of Docker images
SonarQube	Static code analysis (quality + security)

