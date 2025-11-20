Commands

terraform output -raw kube_config  > $HOME/terraform/hetzner-talos-demo/kubeconfig
terraform output -raw talos_config > $HOME/terraform/hetzner-talos-demo/talosconfig
export KUBECONFIG=$HOME/terraform/hetzner-talos-demo/kubeconfig
export TALOSCONFIG=$HOME/terraform/hetzner-talos-demo/talosconfig

alias k=kubectl
