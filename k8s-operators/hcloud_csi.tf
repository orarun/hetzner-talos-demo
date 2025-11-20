resource "helm_release" "hcloud_csi" {
  name       = "hcloud-csi"
  namespace  = "kube-system"

  repository = "https://charts.hetzner.cloud"
  chart      = "hcloud-csi"
  version    = "2.18.0"
}

