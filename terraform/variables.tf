###cloud vars

variable cloud {
  type = map(object({
    cloud_id = string
    folder_id = string
    default_zone = string
    vpc_name = string
  }))
    default = { 
      "develop" = {
        cloud_id = "b1gcd1nmr4tl1hd9duc8"
        folder_id = "b1gj6ia0559mol9ufg9k"
        default_zone = "ru-central1-a"
        vpc_name = "netology"
      }
  }
}

variable "token"{
  type        = string
  description = "enter secret token"
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5YomKL8licFR1heO5WoZl9K8lztjhLWOrXTJW9/nHVJv2hEcSHrmKxqjhwNv/JA1MKfiK/vwLPsFD5608945IUl+psM4Bnak7esZrvPg/rinz2jvxCwP6f/n6n4pMQemikCuVXvCXlJjDVkjT4DDVSuZ7BiStHT+DH1xFzxP+0aZ+lUjHB21UhtiGLlJHav4F2K3uAl7S9n7ufaAUFZEpx3zRlHlryQuxldHkMq3Hgu4JkxzmYGoUvAL0/emfsZn7PUWVUlpHqo98ii4e6SVIMy63vpcudjAIq4ht+veQbJbOTQ7127Obc+6jfBgpXDZCcM6PUAILyEmtTHfdSI9D"
}

variable vm {
  type = map(object({
    cores = number
    memory = number
    core_fraction = number
    zone = string
    image = string
    network_cidr = list(string)
    boot_disk_size = number
    preemptible = bool
    nat = bool
  }))
    default = { 
      "public" = {
        name = "public"
        cores = 2
        memory = 1
        core_fraction = 5
        zone = "ru.central1-a"
        image = "fd80mrhj8fl2oe87o4e1"
        network_cidr = ["192.168.10.0/24"]
        boot_disk_size = 10
        preemptible = true
        nat = true
      },
      "private" = {
        name = "private"
        cores = 2
        memory = 1
        core_fraction = 5
        image = "fd80mrhj8fl2oe87o4e1"
        zone = "ru.central1-b"
        network_cidr = ["192.168.20.0/24"]
        boot_disk_size = 10
        preemptible = true
        nat = false
     }
  }
}