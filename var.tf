# Variable for GCP Provider

variable "gcp_project_id" {
  type = string
}

variable "gcp_region" {
  type = string
}


# Variable for VPC networks

variable "vpc_network_name" {
  type = string

}

variable "private_subnet_name" {
  type = string
}

variable "private_subnet_cidr" {
  type = string
}

variable "private_subnet_secondary_cidr" {
  type = string
}

variable "public_subnet_name" {
  type = string
}


variable "public_subnet_cidr" {
  type = string
}

variable "public_subnet_secondary_cidr" {
  type = string
}

# Variable for Public Compute Engine

variable "firewall_rule_name" {
  type = string
}

variable "firewall_ports" {
  type = list(string)
}

variable "firewall_protocol" {
  type = string
}

variable "firewall_source_range" {
  type = list(string)
}

variable "public_compute_engine_name" {
  type = string
}

variable "public_compute_engine_type" {
  type = string
}

variable "public_compute_engine_zone" {
  type = string
}

variable "compute_engine_network_interface" {
  type = string
}

variable "private_keypath" {
  type = string
}

variable "public_keypath" {
  type = string
}

variable "public_boot_disk_image" {
  type = string
}


variable "instance_script_path" {
  type = string
}

variable "boot_disk_type" {
  type = string

}

variable "boot_disk_size" {
  description = "Size of OS disk in GB"
  type        = number

}

variable "network_tags" {
  type = list(string)
}