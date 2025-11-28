// k8s-operators/data.tf
# data "terraform_remote_state" "infra" {
#   backend = "s3"
#   config = {
#     bucket = "zalando-tfstate-bucket"
#     key    = "infra/terraform.tfstate"
#     region = "main"

#     endpoints = {
#       s3 = "https://hel1.your-objectstorage.com"
#     }

#     skip_credentials_validation = true
#     skip_region_validation      = true
#     skip_metadata_api_check     = true
#     skip_requesting_account_id  = true
#     use_path_style              = true
#     skip_s3_checksum            = true
#   }
# }

data "terraform_remote_state" "infra" {
  backend = "local"

  config = {
    path = "../infra/terraform.tfstate"
  }
}
