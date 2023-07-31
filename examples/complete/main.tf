locals {
  region = "us-east-2"
  additional_tags = {
    Owner       = "squareops"
    Expires     = "Never"
    Department  = "Engineering"
    environment = "prod"
  }
}

module "kafka" {
  source = "../.."
  kafka_enabled = true
  kafka_config = {
    values_yaml   = file("./config/values.yaml")
  }
}