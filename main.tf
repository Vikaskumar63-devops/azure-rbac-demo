terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {}

# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-azure-rbac-demo"
  location = "East US"
}

# Create Azure AD Group
resource "azuread_group" "test_group" {
  display_name     = "TestRBACGroup"
  mail_enabled     = false
  security_enabled = true
}

# Create Azure AD User (Example user - replace with your own logic or use existing users)
resource "azuread_user" "test_user" {
  user_principal_name = "vikas.kumar@example.com"
  display_name        = "Vikas Kumar"
  mail_nickname       = "vikas.kumar"
  password            = "Password@1234"   # For demo only, use secure methods in prod
  force_password_change = false
}

# Add user to group
resource "azuread_group_member" "group_member" {
  group_object_id  = azuread_group.test_group.id
  member_object_id = azuread_user.test_user.object_id
}

# Create a Custom Role Definition (example with Reader permissions)
resource "azurerm_role_definition" "custom_reader" {
  name        = "Custom Reader Role"
  scope       = azurerm_resource_group.rg.id
  description = "Custom Reader role for demo"

  permissions {
    actions = [
      "Microsoft.Resources/subscriptions/resourceGroups/read",
      "Microsoft.Compute/virtualMachines/read",
      "Microsoft.Storage/storageAccounts/read"
    ]
    not_actions = []
  }

  assignable_scopes = [
    azurerm_resource_group.rg.id
  ]
}

# Assign Custom Role to the User
resource "azurerm_role_assignment" "user_role_assignment" {
  scope                = azurerm_resource_group.rg.id
  role_definition_id   = azurerm_role_definition.custom_reader.role_definition_resource_id
  principal_id         = azuread_user.test_user.object_id
}
