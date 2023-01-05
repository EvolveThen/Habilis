module "logsink-549524312528-logbucketsink" {
  source  = "terraform-google-modules/log-export/google"
  version = "~> 7.3.0"

  destination_uri      = module.theghostfox-logging-destination.destination_uri
  log_sink_name        = "549524312528-logbucketsink"
  parent_resource_id   = var.org_id
  parent_resource_type = "organization"
  include_children     = true
}

module "theghostfox-logging-destination" {
  source  = "terraform-google-modules/log-export/google//modules/logbucket"
  version = "~> 7.4.1"

  project_id               = module.logging-tv555-yf059.project_id
  name                     = "theghostfox-logging"
  location                 = "northamerica-northeast1"
  retention_days           = 30
  log_sink_writer_identity = module.logsink-549524312528-logbucketsink.writer_identity
}
