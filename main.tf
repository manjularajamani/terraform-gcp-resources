module "vpc" {
  source                        = "./modules/networks"
  network_name                  = var.vpc_network_name
  gcp_account_id                = var.gcp_project_id
  private_subnet_name           = var.private_subnet_name
  private_subnet_cidr           = var.private_subnet_cidr
  gcp_region                    = var.gcp_region
  private_subnet_secondary_cidr = var.private_subnet_secondary_cidr
  public_subnet_name            = var.public_subnet_name
  public_subnet_cidr            = var.public_subnet_cidr
  public_subnet_secondary_cidr  = var.public_subnet_secondary_cidr


}

module "compute_instance" {
  source         = "./modules/compute_engine"
  gcp_account_id = module.vpc.gcp_project_id

  public_instance_name  = var.public_compute_engine_name
  public_instance_type  = var.public_compute_engine_type
  public_instance_zone  = var.public_compute_engine_zone
  network_interface     = module.vpc.vpc_network_name
  private_key_path      = var.private_keypath
  public_key_path       = var.public_keypath
  public_instance_image = var.public_boot_disk_image
  public_subnet         = module.vpc.public_subnet_name
  script_path           = var.instance_script_path
  disk_type             = var.boot_disk_type
  disk_size             = var.boot_disk_size
  network_tags          = var.network_tags
  ports                 = var.firewall_ports
  porotocol             = var.firewall_protocol
  source_range          = var.firewall_source_range
  firewall_name         = var.firewall_rule_name

  depends_on = [module.vpc]
}

