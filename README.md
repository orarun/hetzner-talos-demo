# Big demo

### Commands


Extract **kubeconfig** and **talosconfig**:
```bash
terraform output -raw kube_config  > $HOME/terraform/hetzner-talos-demo/kubeconfig
terraform output -raw talos_config > $HOME/terraform/hetzner-talos-demo/talosconfig
```

Export **kubeconfig** and **talosconfig**:
```bash
export KUBECONFIG=$HOME/terraform/hetzner-talos-demo/kubeconfig
export TALOSCONFIG=$HOME/terraform/hetzner-talos-demo/talosconfig
```

Define **kubectl** alias:
```bash
alias k=kubectl
```
