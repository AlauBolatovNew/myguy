provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "alau-pepe"
    key    = "gegege"
    region = "us-east-1"
  }
}
