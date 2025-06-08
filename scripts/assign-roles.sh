#!/bin/bash

SUBSCRIPTION_ID="<subscription-id>"
USER_EMAIL="testuser@yourdomain.com"

# Assign Reader role
az role assignment create --assignee $USER_EMAIL --role Reader --scope /subscriptions/$SUBSCRIPTION_ID
