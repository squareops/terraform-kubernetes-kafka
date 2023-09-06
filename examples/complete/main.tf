locals {
  region = "us-east-2"
  additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
}

module "kafka" {
  source = "git@github.com:sq-ia/terraform-kubernetes-kafka.git"
  kafka_config = {
    metrics_enabled                      = true
    heap_size_option                     = "-Xmx1024m -Xms1024m"
    storage_class_name                   = "gp2"
    kafka_pv_volume_size                 = "10Gi"
    kafka_node_replica_count             = 2
    default_partition_per_topic          = 1
    default_replication_factor_per_topic = 1
    zookeeper_enabled                    = true
    zookeper_pv_volume_size              = "10Gi"
    zookeper_node_replica_count          = 2
    sasl_inter_broker_password           = ""
    values_yaml                          = file("./config/values.yaml")
  }
}
