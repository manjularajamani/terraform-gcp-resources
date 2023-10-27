output "instance_public_ip" {
  description = "Public IP address of the Compute Engine instance"
  value       = google_compute_instance.compute_engine.network_interface.0.access_config.0.nat_ip
}
