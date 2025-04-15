resource "yandex_vpc_network" "terraform-network" {
  name = "terraform-network"
}

resource "yandex_vpc_subnet" "subnet-public" {
  name           = "subnet_public"
  zone           = var.vm.public.zone
  network_id     = yandex_vpc_network.terraform-network.id
  v4_cidr_blocks = var.vm.public.network_cidr
}

resource "yandex_vpc_subnet" "subnet-private" {
  name           = "subnet_private"
  zone           = var.vm.private.zone
  network_id     = yandex_vpc_network.terraform-network.id
  v4_cidr_blocks = var.vm.private.network_cidr
  route_table_id = yandex_vpc_route_table.route_table.id
}

resource "yandex_vpc_route_table" "route_table" {
  name       = "route_table"
  network_id = yandex_vpc_network.terraform-network.id
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = yandex_compute_instance.public.network_interface.0.ip_address
  }
}