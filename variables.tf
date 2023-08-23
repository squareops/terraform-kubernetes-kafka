variable "chart_version" {
  type        = string
  default     = "23.0.7"
  description = "Version of the kafka chart that will be used to deploy kafka application."
}

variable "namespace" {
  type        = string
  default     = "kafka"
  description = "Name of the Kubernetes namespace where the kafka deployment will be deployed."
}

variable "kafka_enabled" {
  type        = bool
  default     = true
  description = "enabled the kafka deployment."
}

variable "kafka_config" {
  type = any
  default = {
    kafka_node_replica_count             = 1
    storage_class_name                   = "gp2"
    kafka_pv_volume_size                 = "8Gi"
    default_replication_factor_per_topic = 1
    default_partition_per_topic          = 1
    zookeper_node_replica_count          = 1
    zookeper_pv_volume_size              = "8Gi"
    values_yaml                          = ""
  }
  description = "Specify the configuration settings for kafka and custom YAML values."
}