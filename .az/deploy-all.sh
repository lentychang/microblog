#!/bin/bash
set -e

export resourceGrp=Test
export location=westeurope

az login --service-principal -u $sp_user -p $sp_pw --tenant $tenant
echo "[INFO] Creating new source group"
az group create --name $resourceGrp --location $location

echo "[INFO] Deploy ElasticSearch" && ./deploy-elasticsearch.sh &
echo "[INFO] Deploy Database" && ./deploy-db.sh &
wait
echo "[INFO] Deploy Web"
./deploy-web.sh