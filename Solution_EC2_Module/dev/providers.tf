terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
  alias  = "europe"
  default_tags {
    tags = {
      Enviroment = "Develop"
      Owner      = "Chamo"
      Project    = "CICE Máster"
    }
  }
}

provider "tls" {
  alias = "private_key"
}
