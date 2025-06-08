variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "rg-azure-rbac-demo"
}

variable "user_principal_name" {
  description = "User Principal Name (UPN) of the Azure AD user"
  type        = string
  default     = "vikas.kumar@example.com"
}

variable "user_display_name" {
  description = "Display name of the Azure AD user"
  type        = string
  default     = "Vikas Kumar"
}

variable "user_password" {
  description = "Password for the Azure AD user"
  type        = string
  default     = "Password@1234"
  sensitive   = true
}

variable "group_display_name" {
  description = "Display name of the Azure AD group"
  type        = string
  default     = "TestRBACGroup"
}

variable "custom_role_name" {
  description = "Name of the custom role definition"
  type        = string
  default     = "Custom Reader Role"
}

variable "role_description" {
  description = "Description of the custom role"
  type        = string
  default     = "Custom Reader role for demo"
}
