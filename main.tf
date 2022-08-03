terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "marc-gavanier"

    workspaces {
      prefix = "minecraft-"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.11"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
}
