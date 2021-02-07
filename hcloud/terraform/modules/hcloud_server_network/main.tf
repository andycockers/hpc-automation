resource "hcloud_server_network" "srvnetwork" {
  server_id  = var.server_id
  network_id = var.network_id
}
  