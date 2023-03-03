provider "aws" {
  region = "eu-west-1" # <---- replace with desired deployment region
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

terraform {
  backend "s3" {
    # Replace the values below with your own specific details.
    region         = "eu-west-1"
    bucket         = "264044803517-eu-west-1-terraform-state"
    key            = "create-acm.tfstate"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
