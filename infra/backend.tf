// infra/backend.tf
terraform {
  backend "s3" {
    bucket = "talos-demo-tfstate-bucket"
    key = "infra/terraform.tfstate"

    # region обязателен, но для Hetzner по факту игнорируется
    region = "main"
    endpoints = {
      s3 = "https://hel1.your-objectstorage.com"
    }

    skip_credentials_validation = true
    skip_region_validation      = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true

    use_path_style   = true
    skip_s3_checksum = true
  }
}

