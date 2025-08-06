
terraform { 
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.36"
    }
  }

  cloud { 
    
    organization = "CloudQuickLab" 
    workspaces { 
      name = "PlanDryRun" 
    } 
  } 
}

provider "azurerm" {
  features {}
} 