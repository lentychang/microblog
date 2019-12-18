#!/bin/bash
set -e
BOLD_INFO=$(tput setaf 3; tput bold;)

export resourceGrp=Test
export location=westeurope
echo $BOLD_INFO"Creating new source group" && tput sgr0
az group create --name $resourceGrp --location $location

echo $BOLD_INFO"Deploy ElasticSearch" && tput sgr0 && ./deploy-elasticsearch.sh &
echo $BOLD_INFO"Deploy Database" && tput sgr0 && ./deploy-db.sh &
wait
echo $BOLD_INFO"Deploy Web" tput sgr0
./deploy-web.sh