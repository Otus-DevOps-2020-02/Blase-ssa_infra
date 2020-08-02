variable project {
  description = "Project ID"
}
variable region {
  description = "Region"
  # Значение по умолчанию
  default = "europe-north1"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable disk_image {
  description = "Disk image"
}
variable "private_key_path" {
  # Описание переменной
  description = "Path to the private key used for connection provisioner"
}
variable zone {
  description = "Zone for VM"
  default     = "europe-north1-a"
}
variable vm_count {
  description = "Count for VM"
  default     = "1"
}
variable service_port {
  description = "port number for service"
}
