data "hcloud_image" "snapshot" {
  with_selector = var.type
}

resource "hcloud_server" "node1" {
  name        = format("%s.%s", var.server_name, count.index)
  image       = data.hcloud_image.snapshot.id #The ID is displayed when the image is created
  server_type = var.server_type
  location    = var.location
  ssh_keys    = var.ssh_keys

  count = var.node_count

  network {
      network_id = var.network_id
  }

  }
  