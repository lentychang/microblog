#!/bin/bash
if [ -z ${resourceGrp+x} ]; then export resourceGrp=Test; fi
if [ -z ${location+x} ]; then export location=westeurope; fi

accountName=elasticsearchconfig
sharename=esconfig

esconfigLocDir=/home/lenty/scripts/python/flask/microblog/Docker/esconfig

# create storage account
az storage account create --name $accountName --resource-group $resourceGrp --location $location --sku Standard_LRS

accountKey=$(az storage account keys list --resource-group $resourceGrp --account-name $accountName --query "[0].value" --output tsv)

# create storage share
az storage share create --name $sharename --account-name $accountName --account-key $accountKey

for file in ${esconfigLocDir}/*
do
  az storage file upload --account-name elasticsearchconfig --account-key $accountKey \
        --share-name $sharename --source ${file}
done

# create single-node elastic search server
az container create --name elasticsearch-server \
       	--resource-group $resourceGrp --image docker.elastic.co/elasticsearch/elasticsearch:7.5.0 \
	--ports 80 9200 9300 --cpu 1.0 --memory 1.5 \
	--azure-file-volume-account-name $accountName \
        --azure-file-volume-share-name $sharename \
	--azure-file-volume-account-key $accountKey \
	--azure-file-volume-mount-path /usr/share/elasticsearch/config/ \
	--os-type Linux --dns-name-label elasticsearch \
	--environment-variables ES_PATH_CONF=/usr/share/elasticsearch/config


