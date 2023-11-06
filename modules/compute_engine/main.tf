## Public Compute Engine
resource "google_compute_firewall" "public_firewall_rules" {
  name          = var.firewall_name
  network       = var.network_interface
  source_ranges = var.source_range
  target_tags   = var.target_tags

  dynamic "allow" {
    for_each = [for rule in var.firewall_rules : rule if rule.rule_action == "allow"]
    iterator = rule

    content {
      protocol = lower(rule.value.protocol)
      ports    = rule.value.ports != null ? rule.value.ports : []
    }
  }

}

data "template_file" "selected_image" {
  template = lookup(var.image_urls, var.public_instance_image, null)
}

resource "google_compute_instance" "public_compute_engine" {
  name         = var.public_instance_name
  machine_type = var.public_instance_type
  zone         = var.public_instance_zone
  tags         = var.network_tags


  boot_disk {
    initialize_params {
      image = data.template_file.selected_image.rendered
      type  = var.disk_type
      size  = var.disk_size
    }
  }

  scheduling {
    preemptible       = var.preemptible
    automatic_restart = var.automatic_restart
  }

  network_interface {
    network    = var.network_interface
    subnetwork = var.public_subnet
    access_config {
      # No need to set any properties here
      # Google Cloud will automatically assign an external IP
    }
  }


  labels = {
    name = var.labels
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    timeout     = "1000s"
    private_key = file(var.private_key_path)
    host        = google_compute_instance.public_compute_engine.network_interface.0.access_config.0.nat_ip
  }

  provisioner "file" {
    source      = var.script_path
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

  depends_on = [google_compute_firewall.public_firewall_rules]

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}