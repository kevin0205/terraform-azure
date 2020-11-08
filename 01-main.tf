# 01 Configure the Azure provider
# 設定 Terraform Azure 提供者 hashicorp/azurerm 使用的版本
# https://releases.hashicorp.com/terraform-provider-azurerm/
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

provider "azurerm" {
  features {}
}
