1. Create subscription "development", "staging", "production"
2. cd state_file_init
3. Initial state tf project structure and fill the values in `environments/development/variables.tfvars`
4. `az login`
5. `terraform init`
6. `terraform plan -var-file=environments/development/variables.tfvars`
7. `terraform apply -var-file=environments/development/variables.tfvars`

Copy the output of `sas_container_query_string and` `sas_storage_query_string` from the output of the apply command in terraform.tfstate