provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}

terraform {
  required_version = ">= 0.10.8"
}
