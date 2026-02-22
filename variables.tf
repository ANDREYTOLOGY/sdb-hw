###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "ssh_user" {
  type        = string
  description = "Linux user for SSH keys metadata"
  default     = "ubuntu"
}

variable "image_family" {
  type        = string
  description = "Image family for instances"
  default     = "ubuntu-2204-lts"
}

variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))

  # 2 ВМ БД: main и replica, с разными cpu/ram/disk_volume
  default = [
    { vm_name = "main", cpu = 2, ram = 4, disk_volume = 20 },
    { vm_name = "replica", cpu = 4, ram = 8, disk_volume = 30 },
  ]
}
