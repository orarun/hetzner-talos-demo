// k8s-operator/mysql_operator_pxc_helm.tf

resource "helm_release" "pxc_operator" {
  name       = "percona-pxc-operator"
  namespace  = kubernetes_namespace.percona.metadata[0].name

  repository = "https://percona.github.io/percona-helm-charts/"
  chart      = "pxc-operator"
  version    = "1.14.0"

  set = [
    {
      name  = "installCRD"
      value = "true"
    }
  ]

  timeout         = 300
  cleanup_on_fail = true
}

