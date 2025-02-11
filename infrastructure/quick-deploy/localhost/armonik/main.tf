module "armonik" {
  source                = "../../../modules/armonik"
  working_dir           = "${path.root}/../../.."
  namespace             = var.namespace
  logging_level         = var.logging_level
  mongodb_polling_delay = var.mongodb_polling_delay
  storage_endpoint_url  = var.storage_endpoint_url
  monitoring            = var.monitoring
  compute_plane = { for k, v in var.compute_plane : k => merge({
    partition_data = {
      priority              = 1
      reserved_pods         = 1
      max_pods              = 100
      preemption_percentage = 50
      parent_partition_ids  = []
      pod_configuration     = null
    }
  }, v) }
  control_plane              = var.control_plane
  admin_gui                  = var.admin_gui
  ingress                    = var.ingress
  job_partitions_in_database = var.job_partitions_in_database
  authentication             = var.authentication
}
