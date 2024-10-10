#/bin/bash

#references document: https://docs.aws.amazon.com/eks/latest/userguide/access-policies.html

AWS_REGION=ap-northeast-1 \
AWS_PROFILE=default \
EKS_CLUSTER_NAME=phamtuan-eks \
AWS_USER_ARN=arn:aws:iam::084375555299:user/DE000014 \
TYPE_ACCESS=cluster \
POLICY_ARN=arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy \

echo "Create the access to eks cluster"

aws eks create-access-entry --cluster-name phamtuan-eks --principal-arn arn:aws:iam::084375555299:user/DE000014 --type STANDARD --user DE000014  --kubernetes-groups Viewers --profile default --region ap-northeast-1

 
aws eks associate-access-policy --cluster-name $EKS_CLUSTER_NAME --profile $AWS_PROFILE --region $AWS_REGION --principal-arn $AWS_USER_ARN  --access-scope type=cluster --policy-arn arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy