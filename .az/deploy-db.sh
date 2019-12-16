dbname=microblog
serverName=${dbname}db
serverAdmin=lentychang
serverAdminPw=Zasx1989!
resourceGrp=Test
firewallRuleName=Langstr
loc=westeurope

az sql server create --admin-password $serverAdminPw --admin-user $serverAdmin --resource-group $resourceGrp --name $serverName  --location $loc
az sql server firewall-rule create --resource-group $resourceGrp --server $serverName --name $firewallRuleName --start-ip-address 176.199.210.1 --end-ip-address 176.199.210.254
az sql db create --name $dbname --resource-group $resourceGrp --server $serverName --max-size 1GB
