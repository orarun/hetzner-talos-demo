// postgres_cluster.tf
resource "kubernetes_manifest" "patroni_postgres_cluster" {
  manifest = {
    "apiVersion" = "acid.zalan.do/v1"
    "kind"       = "postgresql"
    "metadata" = {
      "name"      = "app-postgres-cluster"
      "namespace" = "postgres-ha"
    }
    "spec" = {
      "teamId"           = "app"
      "numberOfInstances" = 2

      "volume" = {
        "size" = "10Gi"
        "storageClass" = "hcloud-volumes"
      }

      "postgresql" = {
        "version" = "16"
      }

      "resources" = {
        "requests" = {
          "cpu"    = "500m"
          "memory" = "1Gi"
        }
        "limits" = {
          "cpu"    = "2"
          "memory" = "4Gi"
        }
      }

      "patroni" = {
        "initdb" = {
          "encoding"       = "UTF8"
          "locale"         = "en_US.UTF-8"
          "data-checksums" = "true"
        }
        "ttl"                     = 30
        "loop_wait"               = 10
        "retry_timeout"           = 10
        "maximum_lag_on_failover" = 1048576
      }

      "users" = {
        "app_user" = [
          "superuser",
          "createdb"
        ]
      }

      "databases" = {
        "app_db" = "app_user"
      }

      "enableConnectionPooler"         = true
      "enableReplicaConnectionPooler"  = false

      "connectionPooler" = {
        "numberOfInstances" = 2
        "mode"              = "transaction"
        "maxDBConnections"  = 100
        # при желании можно задать:
        # "schema"     = "pooler"
        # "user"       = "pooler"
        # "dockerImage" = "registry.opensource.zalando.com/acid/pgbouncer"
        # "resources" = {
        #   "requests" = {
        #     "cpu"    = "100m"
        #     "memory" = "128Mi"
        #   }
        #   "limits" = {
        #     "cpu"    = "500m"
        #     "memory" = "256Mi"
        #   }
        # }
      }
    }
  }
}

