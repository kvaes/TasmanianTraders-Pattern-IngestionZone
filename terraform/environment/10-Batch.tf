resource "azurerm_resource_group" "batch" {
  name     = "${var.prefix_environment}-${var.prefix_workload}-${var.batch_identifier}"
  location = "${var.region_primary}"
}

resource "azurerm_storage_account" "storagebatch" {
  name                     = "${var.prefix_workload}${var.prefix_environment}${var.batch_identifier}"
  resource_group_name      = "${azurerm_resource_group.batch.name}"
  location                 = "${azurerm_resource_group.batch.location}"
  account_tier             = "${var.storage_batch_tier}"
  account_replication_type = "${var.storage_batch_resiliency}"
}

resource "azurerm_batch_account" "batch" {
  name                     = "${var.prefix_workload}${var.prefix_environment}${var.batch_identifier}"
  resource_group_name      = "${azurerm_resource_group.batch.name}"
  location                 = "${azurerm_resource_group.batch.location}"
  pool_allocation_mode     = "BatchService"
  storage_account_id       = "${azurerm_storage_account.storagebatch.id}"
}

resource "azurerm_batch_pool" "rosbag" {
  name                = "${var.batch_rosbag_identifier}"
  resource_group_name = "${azurerm_resource_group.batch.name}"
  account_name        = "${azurerm_batch_account.batch.name}"
  display_name        = "${var.batch_rosbag_identifier}"
  vm_size             = "${var.batch_rosbag_vm_size}"
  node_agent_sku_id   = "${var.batch_rosbag_vm_sku}"

  fixed_scale {
    target_dedicated_nodes = "${var.batch_rosbag_nodes_dedicated}"
    target_low_priority_nodes = "${var.batch_rosbag_nodes_lowpriority}"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  start_task {
    command_line         = <<EOF
    bash -c " 
declare -x DEBIAN_FRONTEND=\"noninteractive\" ; 
declare -x TERM=\"linux\" ; 
dpkg --configure -a ; 
curl -sL https://aka.ms/InstallAzureCLIDeb | bash ; 
az extension add --name azure-devops ; 
echo \"deb http://packages.ros.org/ros/ubuntu xenial main\" > /etc/apt/sources.list.d/ros-latest.list ; 
apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 ; 
apt-get update ; 
apt-get install dialog -y ; 
apt-get install ros-kinetic-ros-base python-rosinstall python-rosinstall-generator python-wstool build-essential ros-kinetic-cv-bridge ros-kinetic-rosbag-pandas jq -y ; 
rosdep init ; 
rosdep update ; 
echo \"source /opt/ros/kinetic/setup.bash\" >> /etc/bash.bashrc ; 
EOF
    max_task_retry_count = 0
    wait_for_success     = true

    user_identity {
      auto_user {
        elevation_level = "Admin"
        scope           = "Pool"
      }
    }
  }

}
