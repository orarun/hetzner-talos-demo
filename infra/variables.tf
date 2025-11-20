// variables.tf
variable "hcloud_token" {
  description = "Hetzner Cloud API token"
  type        = string

  validation {
    condition     = length(var.hcloud_token) > 0
    error_message = "hcloud_token must not be empty."
  }
}

variable "cluster_name" {
  description = "Name of the Talos Kubernetes cluster"
  type        = string
  default     = "big-demo-cluster"
}

variable "datacenter_name" {
  description = "Hetzner Cloud datacenter name"
  type        = string
  default     = "hel1-dc2"
}

variable "talos_version" {
  description = "Talos Linux version"
  type        = string
  default     = "v1.11.0"
}

variable "kubernetes_version" {
  description = "Kubernetes version for the cluster"
  type        = string
  default     = "1.30.3"
}

variable "cilium_version" {
  description = "Cilium version"
  type        = string
  default     = "1.16.2"
}

variable "hcloud_ccm_version" {
  description = "Hetzner Cloud Controller Manager version"
  type        = string
  default     = "1.28.0"
}

