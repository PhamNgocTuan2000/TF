terraform {
  backend "s3" {
    bucket = "phamngoctuan-tfstate"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}