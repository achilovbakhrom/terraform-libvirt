variable "username" {
  type        = string
  description = "The username for the ssh"
  sensitive   = true
}

variable "password" {
  type        = string
  description = "The password for the ssh"
  sensitive   = true
}

variable "ip_address" {
  type        = string
  description = "The IP address of the host"
}

variable "ssh_key_path" {
  type        = string
  description = "The path to the SSH key"
}
