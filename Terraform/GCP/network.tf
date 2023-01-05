# VPC and Subnets
module "vpc-host-dev" {
    source  = "terraform-google-modules/network/google"
    version = "~> 5.0"

    project_id   = module.vpc-host-dev-tv555-yf059.project_id
    network_name = "vpc-host-dev"
    routing_mode = "GLOBAL"

    subnets = [
       
        {
            subnet_name           = "subnet-dev-1"
            subnet_ip             = "10.0.0.0/8"
            subnet_region         = "northamerica-northeast1"
            subnet_private_access = true
            subnet_flow_logs      = true
            subnet_flow_logs_sampling = "0.5"
            subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
            subnet_flow_logs_interval = "INTERVAL_10_MIN"
        },
        {
            subnet_name           = "subnet-dev-2"
            subnet_ip             = "11.0.0.0/8"
            subnet_region         = "northamerica-northeast2"
            subnet_private_access = true
            subnet_flow_logs      = true
            subnet_flow_logs_sampling = "0.5"
            subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
            subnet_flow_logs_interval = "INTERVAL_10_MIN"
        },
    ]
    
    routes = [
      {
        name = "rt-vpc-host-dev-1000-egress-internet-default"
        description = "Tag based route through IGW to access internet"
        destination_range = "0.0.0.0/0"
        priority = "1000"
        next_hop_internet = "true"
        tags = "egress-internet"
      },
    ]
}
# Firewall Rules
resource "google_compute_firewall" "vpc-host-dev-allow-iap-rdp" {
  name      = "vpc-host-dev-allow-iap-rdp"
  network   = module.vpc-host-dev.network_name
  project   = module.vpc-host-dev-tv555-yf059.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
      metadata = "INCLUDE_ALL_METADATA"
    }

  allow {
    protocol = "tcp"
    ports    = ["3389",]
  }

  source_ranges = [
  "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "vpc-host-dev-allow-iap-ssh" {
  name      = "vpc-host-dev-allow-iap-ssh"
  network   = module.vpc-host-dev.network_name
  project   = module.vpc-host-dev-tv555-yf059.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
      metadata = "INCLUDE_ALL_METADATA"
    }

  allow {
    protocol = "tcp"
    ports    = ["22",]
  }

  source_ranges = [
  "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "vpc-host-dev-allow-icmp" {
  name      = "vpc-host-dev-allow-icmp"
  network   = module.vpc-host-dev.network_name
  project   = module.vpc-host-dev-tv555-yf059.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
      metadata = "INCLUDE_ALL_METADATA"
    }

  allow {
    protocol = "icmp"
  }

  source_ranges = [
  "10.128.0.0/9",
  ]
}
# NAT Router and config

# VPC and Subnets
module "vpc-host-nonprod" {
    source  = "terraform-google-modules/network/google"
    version = "~> 5.0"

    project_id   = module.vpc-host-nonprod-tv555-yf059.project_id
    network_name = "vpc-host-nonprod"
    routing_mode = "GLOBAL"

    subnets = [
       
        {
            subnet_name           = "subnet-non-prod-1"
            subnet_ip             = "10.0.0.0/8"
            subnet_region         = "northamerica-northeast1"
            subnet_private_access = true
            subnet_flow_logs      = true
            subnet_flow_logs_sampling = "0.5"
            subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
            subnet_flow_logs_interval = "INTERVAL_10_MIN"
        },
        {
            subnet_name           = "subnet-non-prod-2"
            subnet_ip             = "11.0.0.0/8"
            subnet_region         = "northamerica-northeast2"
            subnet_private_access = true
            subnet_flow_logs      = true
            subnet_flow_logs_sampling = "0.5"
            subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
            subnet_flow_logs_interval = "INTERVAL_10_MIN"
        },
    ]
    
    routes = [
      {
        name = "rt-vpc-host-nonprod-1000-egress-internet-default"
        description = "Tag based route through IGW to access internet"
        destination_range = "0.0.0.0/0"
        priority = "1000"
        next_hop_internet = "true"
        tags = "egress-internet"
      },
    ]
}
# Firewall Rules
resource "google_compute_firewall" "vpc-host-nonprod-allow-iap-rdp" {
  name      = "vpc-host-nonprod-allow-iap-rdp"
  network   = module.vpc-host-nonprod.network_name
  project   = module.vpc-host-nonprod-tv555-yf059.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
      metadata = "INCLUDE_ALL_METADATA"
    }

  allow {
    protocol = "tcp"
    ports    = ["3389",]
  }

  source_ranges = [
  "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "vpc-host-nonprod-allow-iap-ssh" {
  name      = "vpc-host-nonprod-allow-iap-ssh"
  network   = module.vpc-host-nonprod.network_name
  project   = module.vpc-host-nonprod-tv555-yf059.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
      metadata = "INCLUDE_ALL_METADATA"
    }

  allow {
    protocol = "tcp"
    ports    = ["22",]
  }

  source_ranges = [
  "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "vpc-host-nonprod-allow-icmp" {
  name      = "vpc-host-nonprod-allow-icmp"
  network   = module.vpc-host-nonprod.network_name
  project   = module.vpc-host-nonprod-tv555-yf059.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
      metadata = "INCLUDE_ALL_METADATA"
    }

  allow {
    protocol = "icmp"
  }

  source_ranges = [
  "10.128.0.0/9",
  ]
}
# NAT Router and config

# VPC and Subnets
module "vpc-host-prod" {
    source  = "terraform-google-modules/network/google"
    version = "~> 5.0"

    project_id   = module.vpc-host-prod-tv555-yf059.project_id
    network_name = "vpc-host-prod"
    routing_mode = "GLOBAL"

    subnets = [
       
        {
            subnet_name           = "subnet-prod-1"
            subnet_ip             = "10.0.0.0/8"
            subnet_region         = "northamerica-northeast1"
            subnet_private_access = true
            subnet_flow_logs      = true
            subnet_flow_logs_sampling = "0.5"
            subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
            subnet_flow_logs_interval = "INTERVAL_10_MIN"
        },
        {
            subnet_name           = "subnet-prod-2"
            subnet_ip             = "11.0.0.0/8"
            subnet_region         = "northamerica-northeast2"
            subnet_private_access = true
            subnet_flow_logs      = true
            subnet_flow_logs_sampling = "0.5"
            subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
            subnet_flow_logs_interval = "INTERVAL_10_MIN"
        },
    ]
    
    routes = [
      {
        name = "rt-vpc-host-prod-1000-egress-internet-default"
        description = "Tag based route through IGW to access internet"
        destination_range = "0.0.0.0/0"
        priority = "1000"
        next_hop_internet = "true"
        tags = "egress-internet"
      },
    ]
}
# Firewall Rules
resource "google_compute_firewall" "vpc-host-prod-allow-iap-rdp" {
  name      = "vpc-host-prod-allow-iap-rdp"
  network   = module.vpc-host-prod.network_name
  project   = module.vpc-host-prod-tv555-yf059.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
      metadata = "INCLUDE_ALL_METADATA"
    }

  allow {
    protocol = "tcp"
    ports    = ["3389",]
  }

  source_ranges = [
  "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "vpc-host-prod-allow-iap-ssh" {
  name      = "vpc-host-prod-allow-iap-ssh"
  network   = module.vpc-host-prod.network_name
  project   = module.vpc-host-prod-tv555-yf059.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
      metadata = "INCLUDE_ALL_METADATA"
    }

  allow {
    protocol = "tcp"
    ports    = ["22",]
  }

  source_ranges = [
  "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "vpc-host-prod-allow-icmp" {
  name      = "vpc-host-prod-allow-icmp"
  network   = module.vpc-host-prod.network_name
  project   = module.vpc-host-prod-tv555-yf059.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
      metadata = "INCLUDE_ALL_METADATA"
    }

  allow {
    protocol = "icmp"
  }

  source_ranges = [
  "10.128.0.0/9",
  ]
}
# NAT Router and config
