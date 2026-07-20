terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

resource "docker_image" "snapcart" {
  name = "snapcart:v1"

  build {
    context = "."
  }
}

resource "docker_container" "snapcart" {
  name  = "snapcart-app"
  image = docker_image.snapcart.image_id

  ports {
    internal = 3000
    external = 8090
  }
}

output "container_name" {
  value = docker_container.snapcart.name
}