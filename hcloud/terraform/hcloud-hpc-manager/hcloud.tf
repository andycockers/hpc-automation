# Hetzner jenkins slave

module "hcloud-manager" {
  source          = "../modules/hcloud_server_manager"
  name            = var.server_name
  server_name     = random_pet.name.id
  server_type     = var.server_type
  location        = var.location
  ssh_keys        = var.ssh_keys
  type            = var.type
  hcloud_token    = var.hcloud_token
  network_id      = var.network_id
}

output "ipv4_address" {
   value = module.hcloud-manager.ipv4_address
}

output "id" {
   value = module.hcloud-manager.id
}