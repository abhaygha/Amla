variable "subscription_id" {
  type = string
}

variable "tenant" {
  type    = string
  default = "default-tenant"
}


variable "environment" {
  type    = string
  default = "dev"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "deploy_acr" {
  type    = bool
  default = false
}

variable "deploy_aks" {
  type    = bool
  default = false
}

variable "deploy_storage" {
  type    = bool
  default = false
}

variable "deploy_sql" {
  type    = bool
  default = false
}

variable "sql_admin_username" {
  type = string
}

variable "sql_admin_password" {
  type = string
}

variable "system_node_vm_size" {
  type        = string
  default     = "Standard_D8as_v4"
  description = "VM size for the default (system) node pool"
}

variable "user_node_vm_size" {
  type        = string
  default     = "Standard_D8as_v4"
  description = "VM size for the user (workload) node pool"
}

variable "vnet_cidr" {
  type        = string
  default     = "172.19.0.0/16"
  description = "CIDR block for the VNet"
}

variable "subnet_cidr" {
  type        = string
  default     = "172.19.202.0/24"
  description = "CIDR block for the AKS subnet"
}
