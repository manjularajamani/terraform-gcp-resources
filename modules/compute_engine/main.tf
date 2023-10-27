resource "google_service_account" "service_account" {
  account_id   = var.gcp_account_id
  display_name = "Service Account for VM Instance"
}


resource "google_compute_firewall" "firewall" {
  name    = "allow-firewalls"
  network = var.network_interface


  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["app"]
}


resource "google_compute_instance" "compute_engine" {
  name         = var.instance_name
  machine_type = var.instance_type
  zone         = var.instance_zone

  tags = ["https-server", "http-server"]

  boot_disk {
   initialize_params {
    image = var.instance_image
    }
  }

  network_interface {
    network = var.network_interface
    access_config {
        # No need to set any properties here
        # Google Cloud will automatically assign an external IP
    }
  }

  labels = {
    name = "app"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    timeout     = "1000s"
    private_key = file(var.private_key_path)
    host        = google_compute_instance.compute_engine.network_interface.0.access_config.0.nat_ip
  }

  provisioner "file" {
    source      = "./modules/compute_engine/script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "bash /tmp/script.sh",
    ]
  }

  service_account {
    scopes = ["cloud-platform"]  
  }

  depends_on = [google_compute_firewall.firewall]

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

}