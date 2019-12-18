#!/bin/bash
if [ -z ${resourceGrp+x} ]; then export resourceGrp=Test; fi
if [ -z ${location+x} ]; then export location=westeurope; fi


appName=microblog

servicePlanName=$appName-plan
serverName=${dbname}db
serverAdmin=lentychang
serverAdminPw=Zasx1989!

firewallRuleName=Langstr
WEBSITES_PORT=5000
imgName=lentychang/microblog:latest

az appservice plan create --name $servicePlanName --resource-group $resourceGrp --is-linux --sku F1
az webapp create --name $appName --resource-group $resourceGrp --plan $servicePlanName --deployment-container-image-name $imgName --startup-file ./boot.sh
az webapp config appsettings set --resource-group $resourceGrp --name $appName --settings WEBSITES_PORT=$WEBSITES_PORT @../env.json

# az webapp up --sku F1 --name $appName --loc $loc --resource-group $resourceGrp 
