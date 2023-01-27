provider "aws"{
    region = var.aws_region
}

variable "aws_region" { default="us-east-1"}

# Centralizar o arquivo de controle de estado do terraform
terraform {
    backend "s3" {
        bucket = "terraform-state-igti-ney"
        key = = "state/xpe/edc/mod1/terraform.tfstate"
        region = "us-east-1"
    }
}