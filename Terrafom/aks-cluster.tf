
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-k8s-resources"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks-demo-ioc" {
  name                = "${var.prefix}-k8s"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.prefix}-k8s"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_container_registry" "aks-demo-acr" {
  name                = "ACRdemoregistryforaks"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"

  admin_enabled = false
}






# This is a Terraform configuration file that creates an Azure Kubernetes Service (AKS) cluster and an Azure Container Registry (ACR) registry.

# The first resource block creates an Azure resource group using the "azurerm_resource_group" resource. The name of the resource group is set to a variable called "prefix" concatenated with "-k8s-resources". The location of the resource group is set to a variable called "location".

# The second resource block creates an AKS cluster using the "azurerm_kubernetes_cluster" resource. The name of the cluster is set to a variable called "prefix" concatenated with "-k8s". The location of the cluster is set to the location of the resource group created earlier. The resource group name is set to the name of the resource group created earlier. The DNS prefix for the cluster is set to a variable called "prefix" concatenated with "-k8s".

# The default node pool for the cluster is set to have one node with a VM size of "Standard_B2s". The identity for the cluster is set to use a system-assigned identity.

# The third resource block creates an ACR registry using the "azurerm_container_registry" resource. The name of the registry is set to "ACRdemoregistryforaks". The resource group name is set to the name of the resource group created earlier. The location of the registry is set to the location of the resource group created earlier. The SKU of the registry is set to "Standard". The admin user for the registry is disabled.