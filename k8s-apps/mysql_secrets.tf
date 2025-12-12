resource "kubernetes_secret" "pxc_secrets" {
  metadata {
    name      = "my-pxc-secrets"
    namespace = "percona"
  }

  type = "Opaque"

  data = {
    root            = base64encode("superrootpass")
    xtrabackup      = base64encode("xtrabackuppass")
    monitor         = base64encode("monitorpass")
    clustercheck    = base64encode("clusterpass")
  }
}

