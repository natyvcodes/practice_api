terraform {
  backend "s3" {
    bucket                      = "terraform-state-lab"
    key                         = "fastapi-app/terraform.tfstate"
    region                      = "us-east-1"
    access_key                  = "test"
    secret_key                  = "test"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    use_path_style               = true

    endpoints = {
      s3 = "http://localhost:4566"
    }
  }
}
provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ecr = "http://localhost:4566"
  }
}

resource "aws_ecr_repository" "app" {
  name = "fastapi-app"
}
