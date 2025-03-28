resource "libvirt_volume" "ubuntu_image" {
  name   = local.ubuntu_image_name
  pool   = local.ubuntu_image_pool
  source = local.ubuntu_image_source
  format = local.ubuntu_image_format
}

resource "libvirt_domain" "vm" {
  name   = "main-vm"
  memory = 2048
  vcpu   = 2
  disk {
    volume_id = libvirt_volume.ubuntu_image.id
  }
  network_interface {
    network_name = "default"
    macvtap      = false
  }

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "serial0"
  }
  graphics {
    type        = "vnc"
    autoport    = true
    listen_type = "address"
  }
}