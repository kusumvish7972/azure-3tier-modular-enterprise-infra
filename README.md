<div align="center">

# ðŸ›ï¸ Azure 3-Tier Modular Enterprise Infrastructure
### Production-Grade Web, App & Database Tiers with 3 Subnets, 3 NSGs, 3 NICs & Dynamic for_each Modules

[![Terraform](https://img.shields.io/badge/Terraform-%3E%3D1.5.0-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://terraform.io)
[![Azure](https://img.shields.io/badge/AzureRM-v3.90%2B-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
[![Architecture](https://img.shields.io/badge/Architecture-3--Tier%20Microsegmented-23272D?style=for-the-badge&logo=cisco&logoColor=white)](#)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg?style=for-the-badge)](LICENSE)

<br/>

> **Complete, battle-tested 3-tier architecture for Azure**. Driven by modular Terraform using `for_each` maps to provision **Web**, **App**, and **Database** tiers with dedicated subnets, micro-segmented NSGs, network interfaces, and compute instances.

</div>

---

## ðŸ“ Architecture Topology

```
                   ðŸŒ Public Internet
                           â”‚
                           â–¼
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚ ðŸŒ Tier 1: Web Tier Subnet (10.200.1.0/24)                  â”‚
â”‚    â€¢ Public IP Entrypoint (HTTPS: 443)                      â”‚
â”‚    â€¢ Web VM + Dedicated NSG                                 â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
                               â”‚ Private Traffic Only
                               â–¼
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚ ðŸ’» Tier 2: Application Tier Subnet (10.200.2.0/24)          â”‚
â”‚    â€¢ App VM (Port 8080)                                     â”‚
â”‚    â€¢ Zero Public Access + Dedicated NSG                     â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
                               â”‚ Private Traffic Only
                               â–¼
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚ ðŸ—„ï¸ Tier 3: Database Tier Subnet (10.200.3.0/24)             â”‚
â”‚    â€¢ DB VM (SQL: 1433)                                      â”‚
â”‚    â€¢ Isolated Network Layer + Dedicated NSG                 â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

---

## ðŸš€ Quickstart Deployment

```bash
git clone https://github.com/kusumvish7972/azure-3tier-modular-enterprise-infra.git
cd azure-3tier-modular-enterprise-infra

terraform init
terraform plan
terraform apply
```

<sub>Architected with Enterprise Precision by **Kusum Vishwakarma**</sub>