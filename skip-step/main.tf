terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"       # اسم الـ RG اللي هتحط فيها الـ storage account
    storage_account_name = "tfstatestorage"   # اسم الـ Storage Account اللي هيحفظ فيها الـ TF state
    container_name       = "tfstate"          # اسم الـ container داخل الـ storage account
    key                  = "terraform.tfstate" # اسم ملف الـ state
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "resourcegroup-test-tbd-3"
  location = "CanadaCentral"
}
