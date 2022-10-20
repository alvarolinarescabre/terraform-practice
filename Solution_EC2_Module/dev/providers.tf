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
  
  default_tags {
    tags = {
      Enviroment = "Develop"
      Owner      = "Chamo"
      Project    = "CICE Máster MMC"
    }
  }
}

provider "tls" {
  alias = "private_key"
}
