variable "prefix_environment" {}
variable "prefix_workload" {}

variable "region_primary" {}
variable "region_secondary" {}

variable "storage_landingzone_identifier" {}
variable "storage_landingzone_tier" {}
variable "storage_landingzone_resiliency" {}

variable "storage_processingarea_identifier" {}
variable "storage_processingarea_tier" {}
variable "storage_processingarea_resiliency" {}

variable "storage_landingzone_count" {}
variable "storage_processingarea_count" {}

variable "keyvault_identifier" {}
variable "keyvault_sku" {}


variable "functions_identifier" {}
variable "functions_tier" {}
variable "functions_size" {}

variable "appinsights_identifier" {}

variable "mssql_identifier" {}
variable "mssql_size" {}

variable "webapp_identifier" {}
variable "webapp_tier" {}
variable "webapp_size" {}