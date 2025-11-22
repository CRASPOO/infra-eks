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
    Name        = "customers-prod",
    Environment = "Production",
    School = "FIAP",
    Year = "2025"
  }
}

variable "instance-type" {
  default = "t3.medium"
}

variable "cidr_vpc" {
  default = "10.0.0.0/16"
}

variable "cidr_subnet" {
  default = "10.0.1.0/24"
}

variable "tags" {
  default = {
    Name = "infra-customers"
  }
}
