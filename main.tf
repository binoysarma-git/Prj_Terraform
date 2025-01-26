# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.112.0"
    }
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example_git" {
  name     = "example-resources-git"
  location = "East US"
}
#create a virtual network
resource "azurerm_virtual_network" "example_git_vn"{
  name="example_git_vn"
  resource_group_name=azurerm_resource_group.example_git.name
  location=azurerm_resource_group.example_git.location
  address_space=["10.123.0.0/16"]
  tags={
    environment="dev"
  }
}

#Create a Subnet 
resource "azurerm_subnet" "example_git_subnet"{
  name="example_git_subnet"
  resource_group_name=azurerm_resource_group.example_git.name
  virtual_network_name=azurerm_virtual_network.example_git_vn.name
  address_prefixes=["10.123.1.0/24"]
}