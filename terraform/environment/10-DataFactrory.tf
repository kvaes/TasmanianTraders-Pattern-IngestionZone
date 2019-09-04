resource "azurerm_resource_group" "azuredatafactory" {
  name     = "${var.prefix_environment}-${var.prefix_workload}-${var.adf_identifier}"
  location = "${var.region_primary}"
}

resource "azurerm_data_factory" "azuredatafactory" {
  name                = "${var.prefix_workload}${var.prefix_environment}${var.adf_identifier}"
  location            = "${azurerm_resource_group.azuredatafactory.location}"
  resource_group_name = "${azurerm_resource_group.azuredatafactory.name}"

  github_configuration {
    account_name      = "${var.adf_account_name}"
    branch_name       = "${var.adf_branch_name}"
    git_url           = "${var.adf_git_url}"
    repository_name   = "${var.adf_repository_name}"
    root_folder       = "${var.adf_root_folder}"
  }
}
