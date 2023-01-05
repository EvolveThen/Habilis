module "logging-tv555-yf059" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "logging"
  project_id = "logging-tv555-yf059"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "monitoring-dev-tv555-yf059" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-dev"
  project_id = "monitoring-dev-tv555-yf059"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "monitoring-nonprod-tv555-yf059" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-nonprod"
  project_id = "monitoring-nonprod-tv555-yf059"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "monitoring-prod-tv555-yf059" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-prod"
  project_id = "monitoring-prod-tv555-yf059"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "vpc-host-dev-tv555-yf059" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-dev"
  project_id = "vpc-host-dev-tv555-yf059"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  enable_shared_vpc_host_project = true
  billing_account = var.billing_account
}

module "vpc-host-nonprod-tv555-yf059" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-nonprod"
  project_id = "vpc-host-nonprod-tv555-yf059"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  enable_shared_vpc_host_project = true
  billing_account = var.billing_account
}

module "vpc-host-prod-tv555-yf059" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-prod"
  project_id = "vpc-host-prod-tv555-yf059"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  enable_shared_vpc_host_project = true
  billing_account = var.billing_account
}
