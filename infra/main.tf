Below is a basic example of how you might structure your Terraform code to create the Azure resources mentioned. This is a simplified example and does not include all possible configurations or best practices for structuring Terraform code.

```hcl
# main.tf
module "app_service" {
  source = "./modules/app_service"
  name   = var.app_service_name
}

module "sql_database" {
  source = "./modules/sql_database"
  name   = var.sql_database_name
}

module "api_management" {
  source = "./modules/api_management"
  name   = var.api_management_name
}

module "azure_function" {
  source = "./modules/azure_function"
  name   = var.azure_function_name
}

output "app_service_id" {
  value = module.app_service.id
}

output "sql_database_id" {
  value = module.sql_database.id
}

output "api_management_id" {
  value = module.api_management.id
}

output "azure_function_id" {
  value = module.azure_function.id
}

# variables.tf
variable "app_service_name" {
  description = "The name of the App Service"
  type        = string
}

variable "sql_database_name" {
  description = "The name of the SQL Database"
  type        = string
}

variable "api_management_name" {
  description = "The name of the API Management"
  type        = string
}

variable "azure_function_name" {
  description = "The name of the Azure Function"
  type        = string
}

# Each module (e.g., ./modules/app_service) would then contain its own main.tf, variables.tf, and outputs.tf files to define, configure, and output the respective Azure resource.
```

Please note that this is a very basic example and does not include all possible configurations or best practices for structuring Terraform code. For example, you might want to include additional variables for resource configurations, use data sources to fetch existing resources, or use Terraform workspaces for environment separation. You should adjust this example based on your specific use case and environment.