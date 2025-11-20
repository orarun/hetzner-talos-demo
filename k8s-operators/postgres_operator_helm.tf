// postgres_operator_helm.tf
resource "helm_release" "postgres_operator" {
  name       = "postgres-operator"
  namespace  = kubernetes_namespace.postgres.metadata[0].name
  repository = "https://opensource.zalando.com/postgres-operator/charts/postgres-operator"
  chart      = "postgres-operator"
  version    = "v1.14.0"

  values = [
    yamlencode({
      configKubernetes = {
        enable_pod_disruption_budget = true
      }
      configMajorVersionUpgrade = {
        minimal_major_versions = ["14", "15", "16"]
      }
    })
  ]

  timeout  = 600
  cleanup_on_fail = true
}

