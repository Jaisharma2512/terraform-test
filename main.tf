terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  project = "secure-air-461520-g7"
  region  = "us-central1"
  credentials = file(var.credentials_file)
}

variable "fw" {
    type = map(object({

    network = string
    direction = string

    allow = list(object({
    protocol = string
    ports = list(string)
    }))

    source_tags = list(string)



    }))
}

variable "credentials_file" {
  description = "Path to GCP service account key file"
  type        = string
}

resource "google_compute_firewall" "dynamic_fw" {
  for_each = var.fw
  name = each.key
  network = each.value.network
  direction = each.value.direction


  dynamic "allow"{
   for_each = each.value.allow

   content{
    protocol = allow.value.protocol
    ports = allow.value.ports
   }

  }
    source_tags = each.value.source_tags
  
}