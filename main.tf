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
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}
#create a virtual network
resource "azurerm_virtual_network" "example_vn"{
  name="example_vn"
  resource_group_name=azurerm_resource_group.example.name
  location=azurerm_resource_group.example.location
  address_space=["10.123.0.0/16"]
  tags={
    environment="dev"
  }
}

