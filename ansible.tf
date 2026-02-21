variable "ansible_provision" {
  type        = bool
  default     = false
  description = "Run ansible-playbook after inventory is generated"
}

locals {
  webservers = [
    for vm in yandex_compute_instance.web : {
      name = vm.name
      ip   = vm.network_interface[0].nat_ip_address
      fqdn = vm.fqdn
    }
  ]

  databases = [
    for _, vm in yandex_compute_instance.db : {
      name = vm.name
      ip   = vm.network_interface[0].nat_ip_address
      fqdn = vm.fqdn
    }
  ]

  storage = [
    {
      name = yandex_compute_instance.storage.name
      ip   = yandex_compute_instance.storage.network_interface[0].nat_ip_address
      fqdn = yandex_compute_instance.storage.fqdn
    }
  ]
}

resource "local_file" "hosts_templatefile" {
  filename = "${abspath(path.module)}/inventory.ini"

  content = templatefile("${abspath(path.module)}/inventory.tftpl", {
    webservers = local.webservers
    databases  = local.databases
    storage    = local.storage
  })

  depends_on = [
    yandex_compute_instance.web,
    yandex_compute_instance.db,
    yandex_compute_instance.storage
  ]
}

resource "null_resource" "ansible_provision" {
  count = var.ansible_provision ? 1 : 0

  depends_on = [local_file.hosts_templatefile]



  triggers = {
    template_rendered = local_file.hosts_templatefile.content
  }
}
