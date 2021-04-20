terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
subscription_id = "2e463f84-dfdc-4bb9-86c5-c041863b09ec"
  client_id       = "51a44063-55c4-42bd-b93b-e0c070fc7807"
  client_secret   = "X.lu.7~mDX2-~h5.cfNWwFseo-Ty7-N.Uy"
  tenant_id       = "e6e024a2-3129-4ed1-a654-f6b3116956ce"

}

resource "azurerm_resource_group" "Terraform_RG1" {
  name     = "Terraform_RG1"
  location = "Canada Central"

  tags = {
    "Tool" = "Terraform"
    "Progress" = "Good"
  }
}
resource "azurerm_container_group" "FirstACI" {
  name                = "first-ACI"
  location            = "Canada Central"
  resource_group_name = "Terraform_RG1"
  ip_address_type     = "public"
  dns_name_label      = "aci-label"
  os_type             = "Linux"

  container {
    name   = "hello-world"
    image  = "microsoft/aci-helloworld:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 443
      protocol = "TCP"
    }
  }

}

resource "azurerm_container_registry" "first-acr" {
  name                     = "containerRegistrygayan1"
  resource_group_name      = "Terraform_RG1"
  location                 = "Canada Central"
  sku                      = "basic"
  admin_enabled            = true
  
}



