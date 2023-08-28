resource "kubernetes_namespace" "kafka" {
  count = var.kafka_enabled ? 1 : 0
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "kafka_deploy" {
  depends_on = [kubernetes_namespace.kafka]
  count      = var.kafka_enabled ? 1 : 0
  name       = "kafka"
  chart      = "${path.module}/helm/kafka/"
  timeout    = 600
  version    = var.chart_version
  namespace  = var.namespace
  values = [
    templatefile("${path.module}/helm/kafka/values.yaml", {
      kafka_node_replica_count             = var.kafka_config.kafka_node_replica_count
      storage_class_name                   = var.kafka_config.storage_class_name
      kafka_pv_volume_size                 = var.kafka_config.kafka_pv_volume_size
      default_partition_per_topic          = var.kafka_config.default_partition_per_topic
      default_replication_factor_per_topic = var.kafka_config.default_replication_factor_per_topic
      zookeeper_enabled                    = var.kafka_config.zookeeper_enabled
      metrics_enabled                      = var.kafka_config.metrics_enabled
      zookeper_node_replica_count          = var.kafka_config.zookeper_node_replica_count
      zookeper_pv_volume_size              = var.kafka_config.zookeper_pv_volume_size
      heap_size_option                     = var.kafka_config.heap_size_option
      sasl_inter_broker_password           = var.kafka_config.sasl_inter_broker_password
    }),
    var.kafka_config.values_yaml
  ]
}

resource "helm_release" "kafka_exporter" {
  depends_on = [kubernetes_namespace.kafka]
  count      = var.kafka_enabled ? 1 : 0
  name       = "kafka-exporter"
  chart      = "prometheus-kafka-exporter"
  repository = "https://prometheus-community.github.io/helm-charts"
  timeout    = 600
  version    = "2.3.0"
  namespace  = var.namespace
  values = [
    templatefile("${path.module}/helm/kafka/kafka-exporter.yaml", { namespace = var.namespace })
  ]
}

resource "kubernetes_pod" "kafka-client" {
  metadata {
    name      = "kafka-client"
    namespace = "kafka"
  }

  spec {
    restart_policy = "Never"
    container {
      image   = "docker.io/bitnami/kafka:3.5.1-debian-11-r1"
      name    = "kafka-client"
      command = ["sleep", "infinity"]
    }
  }
}