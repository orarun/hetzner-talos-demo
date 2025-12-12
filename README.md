# Big demo

## Prerequisites

Put your hcloud token to global.auto.tfvars file like:
```bash
hcloud_token = ""
```


## Bootstrap Kubernetes cluster

Go to the **infra** folder and run:
```bash
terraform init
terraform plan
terraform apply
```

Then extract **kubeconfig** and **talosconfig**:
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

## Install operators and drivers

Go to the **k8s-operators** and run:
```bash
terraform init
terraform plan
terraform apply
```

## Create resources

Go to the **k8s-apps** frolder and run:
```bash
terraform init
terraform plan
terraform apply
```

