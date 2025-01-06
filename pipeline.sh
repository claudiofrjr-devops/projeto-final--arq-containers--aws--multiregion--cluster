#!/bin/bash

set -ex

echo "INICIANDO Rollout do PRE-Deployment"

cd pre-deployment/

rm -rf .terraform

terraform init -backend-config=envireonment/backend.tfvars

sleep 5

terraform apply --auto-approve -var-file=environment/terraform.tfvars


echo "FINALIZANDO Rollout do PRE-Deployment"

cd ../


---------------------------------------------

echo "INICIANDO Rollout da Regiao US-EAST-1"

cd deployment/

rm -rf .terraform

terraform init -backend-config=envireonment/us-east-1/backend.tfvars

sleep 5

terraform apply --auto-approve -var-file=environment/us-east-1/terraform.tfvars


echo "FINALIZANDO Rollout da Regiao US-EAST-1"

cd ../

---------------------------------------------
echo "INICIANDO Rollout da Regiao SA-EAST-1"

cd deployment/

rm -rf .terraform

terraform init -backend-config=envireonment/sa-east-1/backend.tfvars

sleep 5

terraform apply --auto-approve -var-file=environment/sa-east-1/terraform.tfvars

echo "FINALIZANDO Rollout da Regiao SA-EAST-1"

cd ../

---------------------------------------------
echo "INICIANDO Rollout do POST-Deployment"

cd post-deployment/

rm -rf .terraform

terraform init -backend-config=envireonment/backend.tfvars

sleep 5

terraform apply --auto-approve -var-file=environment/terraform.tfvars

echo "FINALIZANDO Rollout do POST-Deployment"

cd ../