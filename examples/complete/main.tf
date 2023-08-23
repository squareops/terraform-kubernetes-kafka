locals {
  region = "us-east-2"
  additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
}

module "kafka" {
  source = "../.."
  kafka_config = {
      kafka_node_replica_count             = 2
      storage_class_name                   = "gp2"
      kafka_pv_volume_size                 = "10Gi"
      default_partition_per_topic          = 1
      default_replication_factor_per_topic = 1
      zookeper_node_replica_count          = 2
      zookeper_pv_volume_size              = "10Gi"
      values_yaml                          = file("./config/values.yaml")
  }
}