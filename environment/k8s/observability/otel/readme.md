
```bash
helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm repo update
helm install otel-collector open-telemetry/opentelemetry-collector --namespace observability --values ./observability/otel/otel-collector-values.yaml --set image.repository="otel/opentelemetry-collector-k8s"


kubectl port-forward svc/otel-collector-opentelemetry-collector -n observability 4317:4317
```