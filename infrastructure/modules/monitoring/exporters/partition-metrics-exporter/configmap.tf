# configmap with all the variables
resource "kubernetes_config_map" "partition_metrics_exporter_config" {
  metadata {
    name      = "partition-metrics-exporter-configmap"
    namespace = var.namespace
  }
  data = {
    Serilog__MinimumLevel                      = var.logging_level
    MongoDB__Host                              = local.mongodb_host
    MongoDB__Port                              = local.mongodb_port
    MongoDB__CAFile                            = (local.mongodb_certificates_secret != "" ? "/mongodb/${local.mongodb_certificates_ca_filename}" : "")
    MongoDB__ReplicaSetName                    = "rs0"
    MongoDB__DatabaseName                      = "database"
    MongoDB__DataRetention                     = "10.00:00:00"
    MongoDB__AllowInsecureTls                  = local.mongodb_allow_insecure_tls
    MongoDB__DirectConnection                  = "true"
    MongoDB__Tls                               = "true"
    MongoDB__TableStorage__PollingDelay        = "00:00:01"
    Redis__EndpointUrl                         = local.redis_url
    Redis__CaPath                              = (local.redis_certificates_secret != "" ? "/redis/${local.redis_certificates_ca_filename}" : "")
    Redis__Timeout                             = local.redis_timeout
    Redis__InstanceName                        = "ArmoniKRedis"
    Redis__ClientName                          = "ArmoniK.Core"
    Redis__Ssl                                 = "true"
    Redis__SslHost                             = local.redis_ssl_host
    Amqp__Host                                 = local.activemq_host
    Amqp__Port                                 = local.activemq_port
    Amqp__CaPath                               = (local.activemq_certificates_secret != "" ? "/amqp/${local.activemq_certificates_ca_filename}" : "")
    Amqp__Scheme                               = "AMQPS"
    Amqp__AllowHostMismatch                    = local.activemq_allow_host_mismatch
    Amqp__MaxPriority                          = "10"
    Amqp__MaxRetries                           = "5"
    Amqp__QueueStorage__LockRefreshPeriodicity = "00:00:45"
    Amqp__QueueStorage__PollPeriodicity        = "00:00:10"
    Amqp__QueueStorage__LockRefreshExtension   = "00:02:00"
    MetricsExporter__Host                      = "http://${local.metrics_exporter_host}"
    MetricsExporter__Port                      = local.metrics_exporter_port
    MetricsExporter__Path                      = "/metrics"
  }
}
