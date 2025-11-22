terraform {
  cloud {
    organization = "spoo-aula9-terraform"
    workspaces {
      name = "infra-customers"
    }
  }
}
