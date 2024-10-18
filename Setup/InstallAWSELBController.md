Install eksctl https://eksctl.io/installation/

Ref: https://docs.aws.amazon.com/eks/latest/userguide/lbc-helm.html

add the iam policy
step 1: curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.7.2/docs/install/iam_policy.json

step 2: aws iam create-policy   
--policy-name PTLoadBalancerControllerIAMPolicy   
--policy-document file://iam_policy.json   
--profile default

add  iam open id

eksctl utils associate-iam-oidc-provider --region=ap-northeast-1 --cluster=phamtuan-eks --profile default --approve

add service account

eksctl create iamserviceaccount \ 
--override-existing-serviceaccounts \   
--cluster=phamtuan-eks \
--namespace=kube-system \  
--name=awsalb-controller \  
--role-name PTAmazonEKSLoadBalancerControllerRole \   
--attach-policy-arn=arn:aws:iam::084375555299:policy/AWSLoadBalancerControllerIAMPolicy \ 
--approve \   
--profile default   
--region ap-northeast-1

add helm

helm install aws-load-balancer-controller eks/aws-load-balancer-controller   
-n kube-system \   
--set clusterName=phamtuan-eks \  
--set serviceAccount.create=false \  
--set serviceAccount.name=awsalb-controller \
--set region=ap-northeast-1 \
--set vpcId=vpc-0583cf412b4f57de8

verify

kubectl get deployment -n kube-system aws-load-balancer-controller

```sh {"id":"01J8MRBEVD2D0WAZQ0PF9VC61J"}
setup game to test

curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.7.2/docs/examples/2048/2048_full.yaml

kubectl apply -f 2048_full.yaml


```