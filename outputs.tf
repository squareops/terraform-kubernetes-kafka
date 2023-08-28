output "kafka_info" {
  description = "Kafka_Info"
  value = {
    kafka-port              = "9092",
    kafka-bootstrap-server  = "kafka.${var.namespace}.svc.cluster.local:9092",
    kafka-headless-endpoint = "kafka-headless.${var.namespace}.svc.cluster.local"
  }
}