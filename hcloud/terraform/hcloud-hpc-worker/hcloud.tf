# Hetzner jenkins worker

module "hcloud-worker" {
  source          = "../modules/hcloud_server"
  name            = var.server_name
  server_name     = random_pet.name.id
  server_type     = var.server_type
  location        = var.location
  ssh_keys        = var.ssh_keys
  type            = var.type
  hcloud_token    = var.hcloud_token
  node_count      = var.node_count
  network_id      = var.network_id
}

output "ipv4_address" {
   value = module.hcloud-worker.ipv4_address
}

output "id" {
   value = module.hcloud-worker.id
}