terraform {
  required_version        = ">= 1.5.0"
  
  backend "s3" {
      bucket              = "cumberland-cloud-gateway-terraform-state"
      dynamodb_table      = "cumberland-cloud-gateway-terraform-lock"
      encrypt             = true
      region              = "us-east-1"
  }

  required_providers {
      aws                 = {
          source          = "hashicorp/aws"
          version         = "5.12.0"
      }
  }
}