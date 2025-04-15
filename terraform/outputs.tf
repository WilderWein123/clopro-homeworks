output "result" {

  value = [
    yandex_compute_instance.public.network_interface.0.nat_ip_address
  ]
}