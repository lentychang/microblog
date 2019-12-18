#!/bin/bash
if [ -z ${resourceGrp+x} ]; then export resourceGrp=Test; fi
if [ -z ${location+x} ]; then export location=westeurope; fi

dbname=microblog
serverName=${dbname}-server
serverAdmin=lentychang
if [ -z ${serverAdminPw+x} ]; then serverAdminPw=serverAdminPw!; fi
firewallRuleName=Langstr

az sql server create --admin-password $serverAdminPw --admin-user $serverAdmin --resource-group $resourceGrp --name $serverName  --location $location
az sql server firewall-rule create --resource-group $resourceGrp --server $serverName --name azure-access --start-ip-address 0.0.0.0 --end-ip-address 0.0.0.0  
az sql db create --name $dbname --resource-group $resourceGrp --server $serverName --max-size 1GB
