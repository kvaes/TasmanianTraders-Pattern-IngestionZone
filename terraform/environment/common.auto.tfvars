prefix_workload = "addemo"

region_primary = "westeurope"
region_secondary = "northeurope"

storage_landingzone_identifier = "landingzone"
storage_landingzone_prefix = "lz"
storage_landingzone_tier = "standard"
storage_landingzone_resiliency = "lrs"
storage_processingarea_identifier = "processingarea"
storage_processingarea_prefix = "pa"
storage_processingarea_tier = "standard"
storage_processingarea_resiliency = "lrs"

adf_identifier = "adf"
adf_account_name = "kvaes"
adf_git_url = "https://github.com/kvaes/TasmanianTraders-Pattern-IngestionZone"
adf_repository_name = "TasmanianTraders-Pattern-IngestionZone"
adf_root_folder = "/adf/"

batch_identifier = "batch"
storage_batch_tier = "standard"
storage_batch_resiliency = "lrs"
batch_rosbag_identifier = "rosbag"
batch_rosbag_vm_size = "standard_l8s"
batch_rosbag_vm_sku = "batch.node.ubuntu 16.04"
batch_rosbag_nodes_dedicated = 0
batch_rosbag_nodes_lowpriority = 1 

keyvault_identifier = "keyvault"
keyvault_sku = "standard"

functions_identifier = "functions"
functions_tier = "Dynamic"
functions_size = "Y1"

appinsights_identifier = "appinsights"

mssql_identifier = "sql"
mssql_size = "S0"

webapp_identifier = "webapp"
webapp_tier = "Free"
webapp_size = "F1"