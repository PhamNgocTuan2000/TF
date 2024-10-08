vpc_name = "dev_env"
cidrvpc  = "20.0.0.0/16"
vm-config = {
  vm1 = {
    instance_type = "t2.medium",
    tags = {
      "ext-name" = "vm2"
    }
  },
  vm2 = {
    instance_type = "t2.large",
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
    user_data_base64            = null
    ext-tags = {
      "fucnt" = "phamtuan-demo-tf"
    }
  }
}