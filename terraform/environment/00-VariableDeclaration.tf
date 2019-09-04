variable "prefix_environment" {}
variable "prefix_workload" {}

variable "region_primary" {}
variable "region_secondary" {}

variable "storage_landingzone_identifier" {}
variable "storage_landingzone_prefix" {}
variable "storage_landingzone_tier" {}
variable "storage_landingzone_resiliency" {}

variable "storage_processingarea_identifier" {}
variable "storage_processingarea_prefix" {}
variable "storage_processingarea_tier" {}
variable "storage_processingarea_resiliency" {}

variable "storage_landingzone_count" {}
variable "storage_processingarea_count" {}

variable "adf_identifier" {}

variable "batch_identifier" {}
variable "storage_batch_tier" {}
variable "storage_batch_resiliency" {}
variable "batch_rosbag_identifier" {}
variable "batch_rosbag_vm_size" {}
variable "batch_rosbag_vm_sku" {}
variable "batch_rosbag_nodes_dedicated" {}
variable "batch_rosbag_nodes_lowpriority" {}


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