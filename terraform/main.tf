terraform {
  # Версия terraform
  required_version = "~>0.12.0"
  # required_version = "0.12.0"
}

provider "google" {
  # Версия провайдера
  version = ">=2.15.0"
  # файл для авторизации сервисным аккаунтом
  # credentials = file("../../infra-271914-7b798a6c40fd.json")
  # ID проекта
  project = var.project
  region  = var.region
}

# resource "google_compute_project_metadata_item" "default" {
#   key   = "appuser_web"
#   value = "my_value"
# }
# resource "google_compute_project_metadata_item" "ssh-keys" {
#   key   = "appuser_web"
#   value = file(var.public_key_path)
# }

resource "google_compute_project_metadata" "ssh-keys" {
  metadata = {
    ssh-keys = "appuser:${file(var.public_key_path)}appuser1:${file(var.public_key_path)}appuser2:${file(var.public_key_path)}"
  }
  project = var.project
}

resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"
  # Название сети, в которой действует правило
  network = "default"
  # Какой доступ разрешить
  allow {
    protocol = "tcp"
    ports    = [var.service_port]
  }
  # Каким адресам разрешаем доступ
  source_ranges = ["0.0.0.0/0"]
  # Правило применимо для инстансов с перечисленными тэгами
  target_tags = ["reddit-app"]
}

resource "google_compute_instance" "app" {
  count        = var.vm_count
  name         = "reddit-app-${count.index}"
  machine_type = "g1-small"
  zone         = var.zone
  tags         = ["reddit-app"]
  network_interface {
    network = "default"
    access_config {}
  }
  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }

  metadata = {
    # путь до публичного ключа
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  connection {
    type  = "ssh"
    host  = self.network_interface[0].access_config[0].nat_ip
    user  = "appuser"
    agent = false
    # путь до приватного ключа
    private_key = var.private_key_path
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }
  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}
