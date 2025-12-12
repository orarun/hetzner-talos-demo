// infra/main.tf
module "talos_cluster" {
  source  = "hcloud-talos/talos/hcloud"
  version = "2.20.2"

  hcloud_token   = var.hcloud_token
  cluster_name   = var.cluster_name
  datacenter_name = var.datacenter_name

  talos_version      = var.talos_version
  kubernetes_version = var.kubernetes_version
  cilium_version     = var.cilium_version
  hcloud_ccm_version = var.hcloud_ccm_version

  # network_ipv4_cidr  = hcloud_network.talos_net.ip_range

  firewall_use_current_ip = true
  disable_arm             = true

  control_plane_count          = 1
  control_plane_server_type    = "cx23"
  control_plane_allow_schedule = true

  worker_nodes = [
    {
      type = "cx23"
      labels = {
        "node.kubernetes.io/instance-type" = "cx23"
      }
    },
    {
      type = "cx23"
      labels = {
        "node.kubernetes.io/instance-type" = "cx23"
      }
    },
    {
      type = "cx23"
      labels = {
        "node.kubernetes.io/instance-type" = "cx23"
      }
    }
  ]
}

