#!/bin/bash
appName=microblog

servicePlanName=$appName-plan
serverName=${dbname}db
serverAdmin=lentychang
serverAdminPw=Zasx1989!
resourceGrp=Test
firewallRuleName=Langstr
loc=westeurope


az appservice plan create --name $servicePlanName --resource-group $resourceGrp --is-linux --sku F1

webapp create --name microblog --resource-group Test --plan microblog-plan --runtime "PYTHON|3.6"
webapp deployment source config-zip --src ./microblog.zip --resource-group Test --name microblog --timeout 600

az webapp up --sku F1 --name $appName --loc $loc --resource-group $resourceGrp 