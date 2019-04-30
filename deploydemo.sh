#!/bin/bash
# script to create  and deploy a container app to Azure App Service on Linux
# $1 name of app

# create a resource group
az group create -n $1rg -l westus2

# create an App Service plan
az appservice plan create --name $1plan --resource-group $1rg --sku B1 --is-linux

# create a web app
az webapp create --resource-group $1rg --plan $1plan --name $1 --deployment-container-image-name sendmarsh/wfgdocker:v1.0.0

# set port to value specified in container app
az webapp config appsettings set --resource-group $1rg --name $1 --settings WEBSITES_PORT=5000