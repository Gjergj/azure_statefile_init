
output "sas_container_query_string" {
  value     = module.state_file.sas_container_query_string
  sensitive = true
}

output "sas_storage_query_string" {
  value     = module.state_file.sas_storage_query_string
  sensitive = true
}
