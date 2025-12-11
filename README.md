# Multi-region 3-Tier Architecture (Terraform)

This repository deploys a **3-tier, multi-region** Azure infrastructure using Terraform. The **Resource Group** is in **Japan East** and there are **three VNets** across different regions. Only the *Web* VM receives a Public IP. Servers themselves (Nginx, Tomcat, MySQL) must be installed/configured separately (e.g., via cloud-init, Ansible, or manual SSH).

---

## Architecture (visual)

```
Resource Group (japan east)
│
├── VNet01 (japan east)
│     └── subnet-web
│             ├── NSG-web
│             ├── NIC-web (japan east)
│             ├── Public IP (japan east)
│             └── VM Web (japan east) (Linux: Standard_D2s_V3)
│
│   <-- peering -->
│
├── VNet02 (japan west)
│     └── subnet-app
│             ├── NSG-app
│             ├── NIC-app (japan west)
│             └── VM App (japan west) (Linux: Standard_D2s_V3)
│
│   <-- peering -->
│
└── VNet03 (south india)
      └── subnet-db
              ├── NSG-db
              ├── NIC-db (south india)
              └── VM DB (south india) (Linux: Standard_D2s_V3)
```
