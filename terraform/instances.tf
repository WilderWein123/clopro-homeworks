resource "yandex_compute_instance" "public" {
  zone = var.vm.public.zone

  resources {
    cores  = var.vm.public.cores
    memory = var.vm.public.memory
    core_fraction = var.vm.public.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.vm.public.image
      size = var.vm.public.boot_disk_size
    }
  }

  scheduling_policy {
    preemptible = var.vm.public.preemptible
  }

    network_interface {
     subnet_id = yandex_vpc_subnet.subnet-public.id
     nat = var.vm.public.nat
  }
  
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}

resource "yandex_compute_instance" "private" {
  zone = var.vm.private.zone

  resources {
    cores  = var.vm.private.cores
    memory = var.vm.private.memory
    core_fraction = var.vm.private.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.vm.private.image
      size = var.vm.private.boot_disk_size
    }
  }

  scheduling_policy {
    preemptible = var.vm.private.preemptible
  }

    network_interface {
     subnet_id = yandex_vpc_subnet.subnet-private.id
     nat = var.vm.private.nat
  }
  
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}

