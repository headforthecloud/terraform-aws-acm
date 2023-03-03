provider "aws" {
  region = "eu-west-1" # <---- replace with desired deployment region
}

provider "aws" { # This is  because we're going to deploy our ACM to us-east-1 so we can later use with CloudFront
  alias  = "us-east-1"
  region = "us-east-1"
}

terraform {
  backend "s3" {
    # Replace the values below with your own specific details.
    region         = "eu-west-1"
    bucket         = "264044803517-eu-west-1-terraform-state"
    key            = "domain-r53-acm.tfstate"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
