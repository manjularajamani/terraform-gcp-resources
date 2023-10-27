# Variable for GCP Provider

variable "gcp_project_id" {
  type        = string
  default     = ""
}

variable "gcp_region" {
  type        = string
  default     = "us-central1"
}


# Variable for Compute Engine

variable "compute_engine_name" {
  type = string
  default = "test-instance"
}

variable "compute_engine_type" {
  type = string
  default = "n2-standard-2"
}

variable "compute_engine_zone" {
  type = string
  default = "us-central1-a"
}

variable "compute_engine_network_interface" {
  type = string
  default = ""
}

variable "private_keypath" {
    type = string
    default = ""
}

variable "public_keypath" {
    type = string
    default = ""
}

variable "boot_disk_image" {
  type = string
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
}