```bash
kubectl create ns loki-stack
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install --values observability/loki/values.yaml loki grafana/loki -n loki-stack
```

# Set up grafana data source 

```bash
http://loki.loki-stack.svc.cluster.local:3100
```