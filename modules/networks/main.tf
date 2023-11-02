resource "google_compute_network" "vpc_network" {
  project                 = var.gcp_account_id
  name                    = var.network_name
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "private_subnet" {
  name          = var.private_subnet_name
  ip_cidr_range = var.private_subnet_cidr
  region        = var.gcp_region
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = true
  secondary_ip_range {
    range_name    = "private-subnet-secondary-range"
    ip_cidr_range = var.private_subnet_secondary_cidr
  }
}

resource "google_compute_subnetwork" "public_subnet" {
  name          = var.public_subnet_name
  ip_cidr_range = var.public_subnet_cidr       # Different range from the private subnet
  region        = var.gcp_region
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = false
  secondary_ip_range {
    range_name    = "public-subnet-secondary-range"
    ip_cidr_range = var.public_subnet_secondary_cidr          # Define your secondary IP range
  }
}
