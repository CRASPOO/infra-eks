variable "bucket_name_backend" {
  default = "customers-backend"
}

variable "region_default" {
  default = "us-east-2"
}

variable "tags_dev" {
  type = map(any)
  default = {
    Name        = "customers-dev"
    Environment = "Develop"
  }
}

variable "tags_prod" {
  type = map(any)
  default = {
    Name        = "customers-prod"
    Environment = "Production"
    School      = "FIAP"
    Year        = "2025"
  }
}

variable "instance-type" {
  default = "t3.medium"
}

variable "cidr_vpc" {
  default = "10.0.0.0/16"
}



variable "tags" {
  default = {
    Name = "infra-customers"
  }
}

variable "principal_user_name" {
  description = "IAM user name for EKS access"
  default     = "Camilarspoo"
}

variable "principal_user_arn" {
  description = "IAM user ARN for EKS access"
  default     = "arn:aws:iam::841740286784:user/Camilarspoo"
}
