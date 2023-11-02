## Variables for GCP provider
gcp_project_id = ""
gcp_region     = "us-central1"

## Variable for VPC networks
vpc_network_name              = "test-vpc"
private_subnet_name           = "private-subnet"
private_subnet_cidr           = "10.0.3.0/24"
private_subnet_secondary_cidr = "192.168.10.0/24"
public_subnet_name            = "public-subnet"
public_subnet_cidr            = "10.0.2.0/24"
public_subnet_secondary_cidr  = "192.168.12.0/24"

## Variable for Compute Engine
public_compute_engine_name       = "public-instance"
public_compute_engine_type       = "n2-standard-2"
public_compute_engine_zone       = "us-central1-a"
compute_engine_network_interface = "test-vpc"
private_keypath                  = ""
public_keypath                   = ""
public_boot_disk_image           = "ubuntu-os-cloud/ubuntu-2004-lts"
instance_script_path             = ""
boot_disk_type                   = "pd-standard"
boot_disk_size                   = "15"
network_tags                     = ["https-server", "http-server", "app"]
firewall_ports                   = ["22", "8080"]
firewall_protocol                = "tcp"
firewall_source_range            = ["0.0.0.0/0"]
firewall_rule_name               = "test-firewalls"