#!/bin/bash
appName=microblog

servicePlanName=$appName-plan
serverName=${dbname}db
serverAdmin=lentychang
serverAdminPw=Zasx1989!
resourceGrp=Test
firewallRuleName=Langstr
loc=westeurope
WEBSITES_PORT=5000
imgName=lentychang/microblog:latest

az appservice plan create --name $servicePlanName --resource-group $resourceGrp --is-linux --sku F1
az webapp create --name $appName --resource-group $resourceGrp --plan $servicePlanName --deployment-container-image-name $imgName --startup-file ./boot.sh
az webapp config appsettings set --resource-group Test --name microblog --settings WEBSITES_PORT=$WEBSITES_PORT @../env.json

# az webapp up --sku F1 --name $appName --loc $loc --resource-group $resourceGrp 
