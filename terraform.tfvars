## Variables for GCP provider
gcp_project_id = "booming-post-396707"
gcp_region     = "us-central1"

## Variable for VPC networks
vpc_network_name              = "test-vpc"
private_subnet_name           = "private-subnet"
private_subnet_cidr           = "10.0.3.0/24"
private_subnet_secondary_cidr = "192.168.10.0/24"
public_subnet_name            = "public-subnet"
public_subnet_cidr            = "10.0.2.0/24"
public_subnet_secondary_cidr  = "192.168.12.0/24"


## Variable for Firewall
firewall_source_range = ["0.0.0.0/0"]
firewall_rule_name    = "test-firewalls"
firewall_target_tags  = ["app"]
rules = [
  {
    rule_action = "allow"
    protocol    = "tcp"
    ports       = [22, 8080]
  },
  {
    rule_action = "allow"
    protocol    = "icmp"
    ports       = [] # ICMP does not use ports, so set it to an empty list
  }
]



## Variable for Compute Engine
public_compute_engine_name       = "test-instance"
public_compute_engine_type       = "n2-standard-2"
public_compute_engine_zone       = "us-central1-a"
compute_engine_network_interface = "test-vpc"
private_keypath                  = "~/.ssh/id_rsa"
public_keypath                   = "~/.ssh/id_rsa.pub"
public_boot_disk_image           = "ubuntu-2004-lts"
image_urls = {
  "ubuntu-2004-lts" = "ubuntu-2004-focal-v20231101" // Family Name    =    // Image Name
  "ubuntu-2204-lts" = "ubuntu-2204-jammy-v20231030"
  "centos-7"        = "centos-7-v20231010"
}

instance_script_path = "~/Documents/projects/terraform-gcp-resources/modules/compute_engine/script.sh"
boot_disk_type       = "pd-standard"
boot_disk_size       = "15"
network_tags         = ["https-server", "http-server", "app"]
instance_labels      = "app"
preemptible          = "true"
automatic_restart    = "false"

