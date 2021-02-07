resource "random_pet" "name" {
  length = 2
  separator = ""
}

output "server_name" {
  value = random_pet.name.id
}