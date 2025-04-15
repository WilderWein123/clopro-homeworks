terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token                    = var.token
  cloud_id                 = var.cloud.develop.cloud_id
  folder_id                = var.cloud.develop.folder_id
  zone                     = var.cloud.develop.default_zone
}