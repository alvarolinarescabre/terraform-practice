terraform {
  tls = {
      source  = "hashicorp/tls"
      version = "4.0.3"
    }
  }
}

provider "tls" {
  alias = "private_key"
}
