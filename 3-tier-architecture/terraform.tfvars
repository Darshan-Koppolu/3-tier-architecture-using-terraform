client_id       = "your_client_id"
client_secret   = "your_client_secret_id"
subscription_id = "your subscription_id"
tenant_id       = "your_tenant_id"

#resource group
rg_name     = "rg01"
rg_location = "japaneast"

#virtual network
vnet_name     = ["vnet01", "vnet02", "vnet03"]
vnet_location = ["japaneast", "japanwest", "southindia"]
address_space = ["10.0.0.0/16", "10.1.0.0/16", "10.2.0.0/16"]

#subnet
sub_name         = ["web-sub", "app-sub", "db-sub"]
address_prefixes = ["10.0.0.0/24", "10.1.0.0/24", "10.2.0.0/24"]

pubip = "web-pub-ip"

vms = ["web", "app", "db"]

nic-card      = ["web01-nic", "app01-nic", "db01-nic"]
nic-ip-config = ["web01-ip-config", "app01-ip-config", "db01-ip-config"]

nsg       = ["web-nsg", "app-nsg", "db-nsg"]
disk-name = ["web01-disk", "app01-disk", "db01-disk"]