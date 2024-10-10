Ref: https://docs.aws.amazon.com/eks/latest/userguide/lbc-helm.html

add  iam open id

eksctl utils associate-iam-oidc-provider --region=us-west-2 --cluster=phamtuan-eks --profile default --approve

add service account

eksctl create iamserviceaccount \
  --cluster=phamtuan-eks \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name AmazonEKSLoadBalancerControllerRole \
  --attach-policy-arn=arn:aws:iam::084375555299:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve \
  --profile default \
  --region ap-northeast-1

add helm

helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=phamtuan-eks \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set region=ap-northeast-1 \
  --set vpcId=vpc-04fb10db0c9888f36

verify
kubectl get deployment -n kube-system aws-load-balancer-controller