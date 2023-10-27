module "compute_instance" {
    
  source                 = "./modules/compute_engine"
  gcp_account_id         = var.gcp_project_id
  instance_name          = var.compute_engine_name
  instance_type          = var.compute_engine_type
  instance_zone          = var.compute_engine_zone
  network_interface      = var.compute_engine_network_interface
  private_key_path       = var.private_keypath
  public_key_path        = var.public_keypath
  instance_image         = var.boot_disk_image
}