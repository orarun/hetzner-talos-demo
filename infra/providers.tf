// providers.tf
provider "hcloud" {
  token = var.hcloud_token
}

provider "talos" {
  // пример — если будет использоваться talos провайдер явно
  // kubeconfig = module.talos_cluster.kubeconfig
}

