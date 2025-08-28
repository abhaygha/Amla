output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "aks_cluster_name" {
  value       = var.deploy_aks ? azurerm_kubernetes_cluster.aks[0].name : null
  description = "Name of the AKS cluster"
}

output "aks_kube_config" {
  value       = var.deploy_aks ? azurerm_kubernetes_cluster.aks[0].kube_config_raw : null
  description = "Kubeconfig for AKS"
  sensitive   = true
}

output "acr_login_server" {
  value       = var.deploy_acr ? azurerm_container_registry.acr[0].login_server : null
  description = "ACR login server"
}

output "storage_account_name" {
  value       = var.deploy_storage ? azurerm_storage_account.storage[0].name : null
  description = "Storage Account Name"
}

output "sql_server_name" {
  value       = var.deploy_sql ? azurerm_mssql_server.sql[0].name : null
  description = "SQL Server Name"
}

output "elastic_pool_name" {
  value       = var.deploy_sql ? azurerm_mssql_elasticpool.elastic_pool[0].name : null
  description = "Elastic Pool Name"
}

output "wbst_database_name" {
  value       = var.deploy_sql ? azurerm_mssql_database.wbst_database[0].name : null
  description = "Main WBST Database Name"
}