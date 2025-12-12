// k8s-apps/mysql_pxc_cluster.tf

resource "helm_release" "pxc_cluster" {
  name       = "pxc-db"
  namespace  = "percona"

  repository = "https://percona.github.io/percona-helm-charts/"
  chart      = "pxc-db"
  version    = "1.14.0"

  values = [
    yamlencode({
      crVersion = "1.14.0"

      pxc = {
        size = 2
        volumeSpec = {
          persistentVolumeClaim = {
            storageClassName = "hcloud-volumes"
            accessModes      = ["ReadWriteOnce"]
            resources = {
              requests = {
                storage = "10Gi"
              }
            }
          }
        }
      }

      haproxy = {
        enabled = true
        size    = 2
      }

      secretsName = "my-pxc-secrets"
    })
  ]
}

