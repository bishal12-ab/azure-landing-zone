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
