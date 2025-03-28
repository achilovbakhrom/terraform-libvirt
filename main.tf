terraform {
  required_version = ">= 1.0.0"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = ">= 0.6.3"
    }
  }
}

provider "libvirt" {
  uri = local.libvirt_provider_uri
}
