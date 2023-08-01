locals {
  region = "us-east-2"
  additional_tags = {
    Owner       = "organization_name"
    Expires     = "Never"
    Department  = "Engineering"
  }
}

module "kafka" {
  source = "../.."
  kafka_config = {
    values_yaml   = file("./config/values.yaml")
  }
}