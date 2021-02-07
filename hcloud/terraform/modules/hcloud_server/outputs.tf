output "ipv4_address" {
   value = hcloud_server.node1.*.ipv4_address
}

output "id" {
   value = hcloud_server.node1.*.id
}