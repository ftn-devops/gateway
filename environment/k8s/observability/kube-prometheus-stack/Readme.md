# Helm install kube prometheus stack

```bash
kubectl create ns observability
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --install observability-stack -f .\observability\kube-prometheus-stack\values.yaml prometheus-community/kube-prometheus-stack -n observability
```


# Access to Grafana dashboards

For now we gonna use port-forward technique to expose grafana service until we configure ingress routes


So execute next command to access to Grafana UI:
```bash
kubectl port-forward svc/observability-stack-grafana  8804:80 -n observability
```

Credetials for admin user you can set up in values.yaml file (admin,admin)