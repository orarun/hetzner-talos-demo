// postgres_namespace.tf
resource "kubernetes_namespace" "postgres" {
  metadata {
    name = "postgres-ha"
  }

  lifecycle {
    prevent_destroy = false
  }
}

