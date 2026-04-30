terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.0"
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

  endpoints {
    s3  = "http://localhost:4566"
    ec2 = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "mi_bucket" {
  bucket = "mi-bucket-practica"
}

resource "aws_instance" "mi_instancia" {
  ami           = "ami-00000000"
  instance_type = "t3.small"

  tags = {
    Name = "instancia-practica"
  }
}

module "mi_bucket_modulo" {
  source      = "./modules/mi-recurso"
  bucket_name = "bucket-desde-modulo"
}
module "mi_bucket_modulo_dos" {
  source      = "./modules/mi-recurso"
  bucket_name = "bucket-desde-modulo-dos"
}
