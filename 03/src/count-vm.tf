
resource "yandex_compute_instance" "web" {
  count = 2

  name     = "web-${count.index + 1}"
  hostname = "web-${count.index + 1}"
  zone     = var.default_zone

  depends_on = [yandex_compute_instance.db]

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.os_image.id
      size     = 10
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id] # SG из задания 1
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${local.ssh_public_key}"
  }
}
