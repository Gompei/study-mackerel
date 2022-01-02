terraform {
  required_providers {
    mackerel = {
      source  = "mackerelio-labs/mackerel"
      version = "~> 0.0.7"
    }
  }
}

provider "mackerel" {
  api_key = var.mackerel_api_key
}
