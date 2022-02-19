#!/bin/bash 

init_git(){
export GHU=tf-cicd
export GHT=$(aws --region us-east-1 secretsmanager get-secret-value --secret-id dev-cicd-GHT | grep SecretString | awk -F": " '{print $2}' | tr -d "'" | jq .GHT | tr -d '"')

git clone https://${GHT}@github.com/TalentFabric/app-deployments.git
git clone https://${GHT}@github.com/TalentFabric/cloud-deployments-aws.git
}
init_kube(){
if [[ -z ${KUBE_CONFS} ]]; then 
    echo "no env for kube confs"
    exit 1
fi
if [[ -d ${HOME}/.kube ]]; then 
    echo "conf exists"
    exit 1
else
    mkdir ${HOME}/.kube
    touch ${HOME}/.kube/config
fi
for i in $(echo $KUBE_CONFS | tr "," "\n")
do
  echo "aws eks --region us-east-1 update-kubeconfig --name ${i}"
  aws eks --region us-east-1 update-kubeconfig --name $i
done
}
init_git
init_kube
exit 0