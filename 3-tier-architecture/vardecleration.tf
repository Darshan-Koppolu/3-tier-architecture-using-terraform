variable "client_id" {}
variable "client_secret" {}
variable "subscription_id" {}
variable "tenant_id" {}

variable "rg_name" {}
variable "rg_location" {}

variable "vnet_name" {
  type = list(any)
}
variable "vnet_location" {
  type = list(any)
}
variable "address_space" {
  type = list(any)

}
variable "sub_name" {
  type = list(any)
}
variable "address_prefixes" {
  type = list(any)
}

variable "web-app-peer" { default = "peer-web-app" }
variable "app-web-peer" { default = "peer-app-web" }
variable "app-db-peer" { default = "peer-app-db" }
variable "db-app-peer" { default = "peer-db-app" }

variable "pubip" {}

variable "vms" {
  type = list(any)

}
variable "nic-card" {
  type = list(any)

}
variable "nic-ip-config" {
  type = list(any)

}
variable "nsg" {
  type = list(any)
}
variable "disk-name" {
  type = list(any)

}