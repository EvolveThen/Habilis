module "organization-iam" {
  source  = "terraform-google-modules/iam/google//modules/organizations_iam"
  version = "~> 7.4"

  organizations = ["549524312528"]

  bindings = {
    
    "roles/billing.admin" = [
      "group:gf-billing-admins@theghostfox.com",
    ]
    
    "roles/resourcemanager.organizationAdmin" = [
      "group:gf-global-admin@theghostfox.com",
    ]
    
  }
}


module "development-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.development.name]

  bindings = {
    
    "roles/compute.instanceAdmin.v1" = [
      "group:gf-developers@theghostfox.com",
    ]
    
    "roles/container.admin" = [
      "group:gf-developers@theghostfox.com",
    ]
    
  }
}


module "non-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.non-production.name]

  bindings = {
    
    "roles/compute.instanceAdmin.v1" = [
      "group:gf-developers@theghostfox.com",
    ]
    
    "roles/container.admin" = [
      "group:gf-developers@theghostfox.com",
    ]
    
  }
}
