resource "azurerm_resource_group" "storagelandingzone" {
  name     = "${var.prefix_environment}-${var.prefix_workload}-${var.storage_landingzone_identifier}"
  location = "${var.region_primary}"
}

resource "azurerm_storage_account" "storagelandingzone" {
  count                    = "${var.storage_landingzone_count}"
  name                     = "${var.prefix_workload}${var.prefix_environment}${var.storage_landingzone_prefix}${format("%03d", count.index+1)}"
  resource_group_name      = "${azurerm_resource_group.storagelandingzone.name}"
  location                 = "${azurerm_resource_group.storagelandingzone.location}"
  account_tier             = "${var.storage_landingzone_tier}"
  account_replication_type = "${var.storage_landingzone_resiliency}"
}

resource "azurerm_resource_group" "storageprocessingarea" {
  name     = "${var.prefix_environment}-${var.prefix_workload}-${var.storage_processingarea_identifier}"
  location = "${var.region_primary}"
}

resource "azurerm_storage_account" "storageprocessingarea" {
  count                    = "${var.storage_processingarea_count}"
  name                     = "${var.prefix_workload}${var.prefix_environment}${var.storage_processingarea_prefix}${format("%03d", count.index+1)}"
  resource_group_name      = "${azurerm_resource_group.storageprocessingarea.name}"
  location                 = "${azurerm_resource_group.storageprocessingarea.location}"
  account_tier             = "${var.storage_processingarea_tier}"
  account_replication_type = "${var.storage_processingarea_resiliency}"
}