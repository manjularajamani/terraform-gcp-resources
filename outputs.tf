output "instance_public_ip" {
    
  description = "Public IP address of the Compute Engine instance"  
  value = module.compute_instance.instance_public_ip
}