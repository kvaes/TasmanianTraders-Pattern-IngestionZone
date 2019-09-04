resource "azurerm_resource_group" "azuredatafactory" {
  name     = "${var.prefix_environment}-${var.prefix_workload}-${var.adf_identifier}"
  location = "${var.region_primary}"
}

resource "azurerm_data_factory" "azuredatafactory" {
  name                = "${var.prefix_workload}${var.prefix_environment}${var.adf_identifier}"
  location            = "${azurerm_resource_group.azuredatafactory.location}"
  resource_group_name = "${azurerm_resource_group.azuredatafactory.name}"

  github_configuration {
    account_name = "kvaes"
    branch_name = "master"
    git_url = "https://github.com/kvaes/TasmanianTraders-Pattern-ADF_Batch_Storage"
    repository_name = "TasmanianTraders-Pattern-ADF_Batch_Storage"
    root_folder = "/"
  }
}