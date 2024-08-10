terraform {
  required_providers {
    azurerm={
        version = "3.115.0"
        source="hashicorp/azurerm"
    }
  }
}
  provider "azurerm"{
    features{

    }
  }
 
 resource "azurerm_resource_group" "terrform_rg_day1"{
    name ="mytf-rg-day1"
    location= "centralindia"
    tags={

        "terraform"="terraform"
    }
 }