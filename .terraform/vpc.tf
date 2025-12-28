resource "aws_vpc" "vpc_fiap" {
  cidr_block           = var.cidr_vpc
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(var.tags, {
    Project = var.cluster_name
    expiry  = local.expiry_iso
  })
}