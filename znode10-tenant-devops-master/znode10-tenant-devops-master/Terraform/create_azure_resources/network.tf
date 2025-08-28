# network.tf
# VNet for AKS
resource "azurerm_virtual_network" "aks_vnet" {
  count               = var.deploy_aks ? 1 : 0
  name                = var.vnet_cidr == "" ? "vnet-aks-${var.tenant}-${var.environment}" : "vnet-aks-${var.tenant}-${var.environment}"
  address_space       = var.vnet_cidr == "" ? ["10.0.0.0/16"] : [var.vnet_cidr]
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
}

# Subnet for AKS
resource "azurerm_subnet" "aks_subnet" {
  count                = var.deploy_aks ? 1 : 0
  name                 = var.subnet_cidr == "" ? "snet-aks-${var.tenant}-${var.environment}" : "snet-aks-${var.tenant}-${var.environment}"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.aks_vnet[0].name
  address_prefixes     = var.subnet_cidr == "" ? ["10.0.1.0/24"] : [var.subnet_cidr]
}

# Assign Network Contributor to AKS for subnet
resource "azurerm_role_assignment" "aks_subnet_role" {
  count                = var.deploy_aks ? 1 : 0
  principal_id         = azurerm_kubernetes_cluster.aks[0].identity[0].principal_id
  role_definition_name = "Network Contributor"
  scope                = azurerm_subnet.aks_subnet[0].id

  depends_on = [
    azurerm_kubernetes_cluster.aks,
    azurerm_subnet.aks_subnet
  ]
}
