resource "libvirt_pool" "default" {
  name = "main-pool"
  type = "dir"

  target {
    path = "/home/admin/libvirt_images"
  }
}

resource "libvirt_volume" "ubuntu_image" {
  name   = local.ubuntu_image_name
  pool   = local.ubuntu_image_pool
  format = local.ubuntu_image_format
  size   = 1024 * 1024 * 1024 * 20

  depends_on = [libvirt_pool.default]
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
    target_port = "0"
  }
  graphics {
    type        = "vnc"
    autoport    = true
    listen_type = "address"
  }
}