output "gcp_project_id" {

  description = "GCP Project ID"
  value       = module.vpc.gcp_project_id
}

output "instance_public_ip" {

  description = "Public IP address of the Compute Engine instance"
  value       = module.compute_instance.instance_public_ip
}