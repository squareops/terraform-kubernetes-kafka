resource "kubernetes_namespace" "kafka" {
  count  = var.kafka_enabled ? 1 : 0
  metadata {
    name   = var.namespace
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
    templatefile("${path.module}/helm/kafka/values.yaml", {}),
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
    templatefile("${path.module}/helm/kafka/kafka-exporter.yaml", {namespace = var.namespace})
  ]
}

resource "kubernetes_pod" "kafka-client" {
  metadata {
    name = "kafka-client"
    namespace = "kafka"
  }

  spec {
    restart_policy = "Never"
    container {
      image = "docker.io/bitnami/kafka:3.5.1-debian-11-r1"
      name  = "kafka-client"
      command = [ "sleep", "infinity" ]
    }
  }
}