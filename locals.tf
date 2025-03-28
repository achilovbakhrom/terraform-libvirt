locals {
  libvirt_provider_uri = "qemu+ssh://${var.username}@${var.ip_address}/system?keyfile=${var.ssh_key_path}"
}

locals {
  ubuntu_image_name   = "ubuntu.qcow2"
  ubuntu_image_pool   = "default"
  ubuntu_image_source = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
  ubuntu_image_format = "qcow2"
}

