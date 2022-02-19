#!/bin/bash 

export GHU=tf-cicd
export GHT=$(aws --region us-east-1 secretsmanager get-secret-value --secret-id dev-cicd-GHT | grep SecretString | awk -F": " '{print $2}' | tr -d "'" | jq .GHT | tr -d '"')

git clone https://${GHT}@github.com/TalentFabric/app-deployments.git
git clone https://${GHT}@github.com/TalentFabric/cloud-deployments-aws.git
exit 0