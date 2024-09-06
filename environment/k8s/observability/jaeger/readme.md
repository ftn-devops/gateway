
```bash
helm repo add jaegertracing https://jaegertracing.github.io/helm-charts
helm repo update
helm upgrade --install jaeger jaegertracing/jaeger --namespace observability --history-max 3 --values observability/jaeger/values.yaml
```

Access jaeger UI:
```bash
kubectl port-forward svc/jaeger-query -n observability 16686:16686
```

deploy otel collector also