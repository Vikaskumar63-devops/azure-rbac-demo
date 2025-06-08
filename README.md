# Azure RBAC and Entra ID Management Task

This repository contains documentation and example scripts to complete the task of managing Azure subscriptions, Entra ID, users, groups, RBAC roles, and custom roles using Azure CLI.

## Task Overview

- Observe assigned Subscriptions
- Observe Azure Entra ID or create own Azure Entra ID in personal Azure account
- Create test users and groups
- Assign RBAC roles to users and test
- Create custom roles and assign to users and test

## Prerequisites

- Azure CLI installed ([Install guide](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli))
- Azure subscription access
- Permissions to create users, groups, and roles

## Step-by-step

### 1. Observe Assigned Subscriptions

```bash
az account list --output table
