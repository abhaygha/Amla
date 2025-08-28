
# Local Variables (Declared FIRST)
locals {
  container_names = [
    "str${var.tenant}${var.environment}",
    "${var.tenant}${var.environment}-db",
    "znode10",
    "z10-container",
    "z10-payment",
    "z10-plugin",
    "z10-data",
    "z10-resources"
  ]

  file_share_names = [
    "z10-mongofileshare",
    "z10-elasticfileshare"
  ]

  common_tags = {
    environment = var.environment
    tenant      = var.tenant
    created_by  = "terraform"
  }
}


# Resource Group
resource "azurerm_resource_group" "main" {
  name     = "rg-${var.tenant}-${var.environment}"
  location = var.location
  tags = local.common_tags
}
# Azure Container Registry (Optional)
resource "azurerm_container_registry" "acr" {
  count               = var.deploy_acr ? 1 : 0
  name                = "acr${var.tenant}${var.environment}"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
  tags = local.common_tags
}

resource "azurerm_kubernetes_cluster" "aks" {
  count               = var.deploy_aks ? 1 : 0
  name                = "aks-${var.tenant}-${var.environment}"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "aks-${var.tenant}-${var.environment}"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name                  = "znode10apl"
    vm_size               = var.system_node_vm_size
    node_count            = 1
    auto_scaling_enabled  = true
    min_count             = 1
    max_count             = 2
    vnet_subnet_id        = azurerm_subnet.aks_subnet[0].id
  }

  network_profile {
    network_plugin    = "azure"
    network_policy    = "calico"
    load_balancer_sku = "standard"
    dns_service_ip    = "10.0.0.10"
    service_cidr      = "10.0.0.0/16"
    pod_cidr          = null
    outbound_type     = "loadBalancer"
  }

  tags = local.common_tags
}

resource "azurerm_kubernetes_cluster_node_pool" "user_node_pool" {
  count                 = var.deploy_aks ? 1 : 0
  name                  = "znode10upl"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks[0].id
  vm_size               = var.user_node_vm_size
  node_count            = 1
  auto_scaling_enabled  = true
  min_count             = 1
  max_count             = 2
  mode                  = "User"
  tags = local.common_tags
}

# Storage Account with CDN
resource "azurerm_storage_account" "storage" {
  count                    = var.deploy_storage ? 1 : 0
  name                     = lower("str${var.tenant}${var.environment}")
  resource_group_name      = azurerm_resource_group.main.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = local.common_tags
}

# Storage Containers
resource "azurerm_storage_container" "container" {
  count                 = var.deploy_storage ? length(local.container_names) : 0
  name                  = local.container_names[count.index]
  storage_account_name  = azurerm_storage_account.storage[0].name
  container_access_type = "container"

}

# File Shares
resource "azurerm_storage_share" "file_share" {
  count                 = var.deploy_storage ? length(local.file_share_names) : 0
  name                  = local.file_share_names[count.index]
  storage_account_name  = azurerm_storage_account.storage[0].name
  quota                 = 15  # Quota in GB
}

# SQL Server with Elastic Pool and Databases
resource "azurerm_mssql_server" "sql" {
  count                        = var.deploy_sql ? 1 : 0
  name                         = lower("sql-${var.tenant}-${var.environment}-ep")
  resource_group_name          = azurerm_resource_group.main.name
  location                     = var.location
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
  version                      = "12.0"
  public_network_access_enabled = true
  tags = local.common_tags
}

# Firewall rule to allow Azure services to access the SQL Server
resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  count            = var.deploy_sql ? 1 : 0
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.sql[0].id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
  }

# Elastic Pool with General Purpose Tier
resource "azurerm_mssql_elasticpool" "elastic_pool" {
  count               = var.deploy_sql ? 1 : 0
  name                = "ep-${var.tenant}-${var.environment}"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  server_name         = azurerm_mssql_server.sql[0].name
  license_type = "BasePrice"

  sku {
    name     = "GP_Gen5"
    tier     = "GeneralPurpose"
    family   = "Gen5"
    capacity = 4
  }

  max_size_gb = 50

  per_database_settings {
    min_capacity = 0
    max_capacity = 4
  }
  tags = local.common_tags
}

# SQL Database: wbst_z10 with Elastic General Purpose
resource "azurerm_mssql_database" "wbst_database" {
  count           = var.deploy_sql ? 1 : 0
  name            = "wbst_${var.tenant}_${var.environment}"
  server_id       = azurerm_mssql_server.sql[0].id
  elastic_pool_id = azurerm_mssql_elasticpool.elastic_pool[0].id
  sku_name        = "ElasticPool"
  tags = local.common_tags
}

# SQL Databases: hgfr_z10, pymt_z10, rceg_z10, pymt_mngr with Elastic General Purpose
resource "azurerm_mssql_database" "basic_databases" {
  count               = var.deploy_sql ? 3 : 0
  name                = "${element(["hgfr", "rceg", "pymg"], count.index)}_${var.tenant}_${var.environment}"
  server_id           = azurerm_mssql_server.sql[0].id
  elastic_pool_id     = azurerm_mssql_elasticpool.elastic_pool[0].id
  sku_name            = "ElasticPool"
  tags = local.common_tags
}
