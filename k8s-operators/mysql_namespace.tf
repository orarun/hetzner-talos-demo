// mysql_namespace.tf

resource "kubernetes_namespace" "percona" {
  metadata {
    name = "percona"
  }

  lifecycle {
    prevent_destroy = false
  }
}

