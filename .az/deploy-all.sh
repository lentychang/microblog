#!/bin/bash
./deploy-elasticsearch.sh &
./deploy-db.sh && ./deploy-web.sh