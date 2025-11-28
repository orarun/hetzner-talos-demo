// k8s-apps/main.tf
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

locals {
  kube = data.terraform_remote_state.infra.outputs.kubeconfig_data
}

provider "kubernetes" {
  host                   = local.kube.host
  client_certificate     = local.kube.client_certificate
  client_key             = local.kube.client_key
  cluster_ca_certificate = local.kube.cluster_ca_certificate
}

provider "helm" {
  kubernetes = {
    host                   = local.kube.host
    client_certificate     = local.kube.client_certificate
    client_key             = local.kube.client_key
    cluster_ca_certificate = local.kube.cluster_ca_certificate
  }
}

