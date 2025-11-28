// k8s-apps/data.tf
data "kubernetes_secret" "postgres_app_user" {
  metadata {
    name      = "app-postgres-cluster.app-user.credentials.postgresql.acid.zalan.do"
    namespace = "postgres-ha"
  }

  depends_on = [kubernetes_manifest.patroni_postgres_cluster]
}

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
