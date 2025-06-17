# resource "azurerm_monitor_diagnostic_setting" "diag" {
#   name                       = "diag-postgres"
#   target_resource_id         = azurerm_postgresql_flexible_server.postgres.id
#   log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

#   log {
#     category = "PostgreSQLLogs"
#     enabled  = true

#     retention_policy {
#       enabled = false
#     }
#   }

#   metric {
#     category = "AllMetrics"
#     enabled  = true

#     retention_policy {
#       enabled = false
#     }
#   }
# }

# resource "azurerm_log_analytics_workspace" "law" {
#   name                = "law-postgres-monitor"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   sku                 = "PerGB2018"
#   retention_in_days   = 30
# }