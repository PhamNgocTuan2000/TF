
env_prefix                             = "dev"
vpc_name                               = "phamtuan-vpc"
cidrvpc                                = "10.0.0.0/16"
enable_nat_gateway                     = true
single_nat_gateway                     = true
enable_dns_hostnames                   = true
create_database_subnet_group           = true
create_database_subnet_route_table     = true
create_database_internet_gateway_route = true
enable_flow_log                        = true
create_flow_log_cloudwatch_iam_role    = true
create_flow_log_cloudwatch_log_group   = true
eks_config = {
  cluster_name                                   = "phamtuan-eks"
  cluster_version                                = "1.30"
  min_size                                       = 3
  max_size                                       = 9
  eks_managed_node_group_defaults_instance_types = ["t2.large", "t2.medium", "t2.xlarge"]
  instance_type                                  = "t2.medium"
  instance_types                                 = ["t2.large", "t2.medium", "t2.xlarge"]
  manage_aws_auth_configmap                      = true
  endpoint_public_access                         = true
  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::629526135429:user/joe-dev"
      username = "joe-dev"
      groups   = ["system:masters"]
    },
  ]
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"],
  eks_cw_logging                       = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}
vm-config = {
  vm1 = {
    instance_type = "t2.small",
    tags = {
      "ext-name" = "vm2"
      "funct"    = "purpose test"
    }
  },
  vm2 = {
    instance_type = "t2.medium",
    tags          = {}
  }
}
bastion_definition = {
  "bastion" = {
    associate_public_ip_address = false
    bastion_ami                 = "ami-0d9144c9f9b4eea3b"
    bastion_instance_class      = "t3.medium"
    bastion_monitoring          = true
    bastion_name                = "bastion"
    bastion_public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDX6gADqn6GpfCZOvuRpvcoz944bHoQ+blzFVD9Lix4/3UopjCI2vQAk6Cu2qn55lmIaZEHLvPqTbk4ydbEiH+6M3CBN9ok58BzAeEIKen6+q9F89Xui9sh8FWgyWvphk8nIoMbyAAmu0fZg+4EuzZqpf0jNTAvVGULiEXQEfY0upWtBxQ9q2vTU6Yoh1avuWv1vJSFuD2n75HEcOHvvq2OmEYdkNsa360aMVbCtpJ1QwAatL5cWa0OCrVlXVYbzP/bQgejMbAcX446zn6FH5NQi+7amT5Q2LN+BrAARx756+FN0wr86qyG/DVQRdRF6FiaRBuZXkNl45OzWVonHe/XzGgsZe0NgdFklNjKapeauGdwLVbAHuC3yL64xFQhk2EtXgtiCctP2bEFTlo7epIZPDQzT3ACeYjmq8gzT2qnD1qH2E4f2WusCzqd7Zqc6Bt64X8qFg6yc977M8Eu1WAIFr1DGtZv2fNd3cwio6J+Mwaj4tXyA8eBxFvoY9uZyBOTSN7MFVoxzWe5sFYj5tVKV4PCHyeIP8epU7j3kGOhPDlOXft4JDZrXFNZenduvNzS9BR+Z2l5AyIqPbyqzfjJTlAGUWoq9mRO5WQASX5CXT9Gw7INFP8iL5IAmiMt2YV5G1zK/Lsp4+OwsaEn13ukKUZokLmP7MzwnzGhBvfBOQ== luckylukes2k@gmail.com"
    trusted_ips                 = ["42.117.49.54/32"]

    user_data_base64 = null
    ext-tags = {
      "fucnt" = "phamtuan-demo-tf"
    }
  }
}
cluster_endpoint_public_access = true