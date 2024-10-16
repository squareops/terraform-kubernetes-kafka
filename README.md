## Kafka

![squareops_avatar]

[squareops_avatar]: https://squareops.com/wp-content/uploads/2022/12/squareops-logo.png

### [SquareOps Technologies](https://squareops.com/) Your DevOps Partner for Accelerating cloud journey.
<br>

This module deploys Kafka. With this module, take the advantage of kafka installation in your K8s Cluster. Apache Kafka is a distributed event store and stream-processing platform. It is an open-source system developed by the Apache Software Foundation written in Java and Scala. The project aims to provide a unified, high-throughput, low-latency platform for handling real-time data feeds. This repository contains the necessary files and code to run and configure the Kafka tool effectively.
## Important Notes:
This module is compatible with EKS version 1.23,1.24,1.25,1.26,1.27,1.28,1.29 which is great news for users deploying the module on an EKS cluster running that version. Review the module's documentation, meet specific configuration requirements, and test thoroughly after deployment to ensure everything works as expected.

## Supported Versions:

|  Kafka Helm Chart Version    |     K8s supported version   |  
| :-----:                       |         :---                |
| **29.3.7**                     |    **1.23,1.24,1.25,1.26,1.27,1.28,1.29,1.30**           |


## Usage Example

```hcl
module "kafka" {
  source = "../.."
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

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.57 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.kafka_deploy](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.kafka_exporter](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.kafka](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_pod.kafka-client](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/pod) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Version of the kafka chart that will be used to deploy kafka application. | `string` | `"29.3.7"` | no |
| <a name="input_kafka_config"></a> [kafka\_config](#input\_kafka\_config) | Specify the configuration settings for kafka and custom YAML values. | `any` | <pre>{<br>  "default_partition_per_topic": 1,<br>  "default_replication_factor_per_topic": 1,<br>  "heap_size_option": "-Xmx1024m -Xms1024m",<br>  "kafka_node_replica_count": 1,<br>  "kafka_pv_volume_size": "8Gi",<br>  "metrics_enabled": true,<br>  "sasl_inter_broker_password": "",<br>  "storage_class_name": "gp2",<br>  "values_yaml": "",<br>  "zookeeper_enabled": true,<br>  "zookeper_node_replica_count": 1,<br>  "zookeper_pv_volume_size": "8Gi"<br>}</pre> | no |
| <a name="input_kafka_enabled"></a> [kafka\_enabled](#input\_kafka\_enabled) | enabled the kafka deployment. | `bool` | `true` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Name of the Kubernetes namespace where the kafka deployment will be deployed. | `string` | `"kafka"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kafka_info"></a> [kafka\_info](#output\_kafka\_info) | Kafka\_Info |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contribution & Issue Reporting

To report an issue with a project:

  1. Check the repository's [issue tracker](https://github.com/sq-ia/terraform-kubernetes-kafka/issues) on GitHub
  2. Search to see if the issue has already been reported
  3. If you can't find an answer to your question in the documentation or issue tracker, you can ask a question by creating a new issue. Be sure to provide enough context and details so others can understand your problem.

## License

Apache License, Version 2.0, January 2004 (http://www.apache.org/licenses/).

## Support Us

To support a GitHub project by liking it, you can follow these steps:

  1. Visit the repository: Navigate to the [GitHub repository](https://github.com/sq-ia/terraform-kubernetes-kafka).

  2. Click the "Star" button: On the repository page, you'll see a "Star" button in the upper right corner. Clicking on it will star the repository, indicating your support for the project.

  3. Optionally, you can also leave a comment on the repository or open an issue to give feedback or suggest changes.

Starring a repository on GitHub is a simple way to show your support and appreciation for the project. It also helps to increase the visibility of the project and make it more discoverable to others.

## Who we are

We believe that the key to success in the digital age is the ability to deliver value quickly and reliably. That’s why we offer a comprehensive range of DevOps & Cloud services designed to help your organization optimize its systems & Processes for speed and agility.

  1. We are an AWS Advanced consulting partner which reflects our deep expertise in AWS Cloud and helping 100+ clients over the last 5 years.
  2. Expertise in Kubernetes and overall container solution helps companies expedite their journey by 10X.
  3. Infrastructure Automation is a key component to the success of our Clients and our Expertise helps deliver the same in the shortest time.
  4. DevSecOps as a service to implement security within the overall DevOps process and helping companies deploy securely and at speed.
  5. Platform engineering which supports scalable,Cost efficient infrastructure that supports rapid development, testing, and deployment.
  6. 24*7 SRE service to help you Monitor the state of your infrastructure and eradicate any issue within the SLA.

We provide [support](https://squareops.com/contact-us/) on all of our projects, no matter how small or large they may be.

To find more information about our company, visit [squareops.com](https://squareops.com/), follow us on [Linkedin](https://www.linkedin.com/company/squareops-technologies-pvt-ltd/), or fill out a [job application](https://squareops.com/careers/). You can also checkout our [Case-studies](https://squareops.com/case-studies/) or [Blogs](https://squareops.com/blog/) to understand more about our solutions. If you have any questions or would like assistance with your cloud strategy and implementation, please don't hesitate to [contact us](https://squareops.com/contact-us/).
