kubectl apply -f ./postgres/
kubectl apply -f ./cassandra/
kubectl apply -f ./rabbitmq/
kubectl apply -f ./pgadmin/
echo "====================================="
echo "waiting init resources to be ready..."
sleep 30

kubectl apply -R -f ./

echo "====================================="
echo "waiting init OUR resources to be ready... THEN installing observability stack"
sleep 30

kubectl create ns observability
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --install observability-stack -f ./observability/kube-prometheus-stack/values.yaml prometheus-community/kube-prometheus-stack -n observability

helm repo add jaegertracing https://jaegertracing.github.io/helm-charts
helm repo update
helm upgrade --install jaeger jaegertracing/jaeger --namespace observability --history-max 3 --values observability/jaeger/values.yaml
kubectl apply -f ./observability/jaeger/simplest.yaml

kubectl create ns loki-stack
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install --values observability/loki/values.yaml loki grafana/loki -n loki-stack

helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm repo update
helm install otel-collector open-telemetry/opentelemetry-collector --namespace observability --values ./observability/otel/otel-collector-values.yaml --set image.repository="otel/opentelemetry-collector-k8s"

kubectl apply -f ./observability/kube-prometheus-stack/grafana-loadbalancer.yaml
kubectl apply -f ./observability/jaeger/jaeger-loadbalancer.yaml


echo "====================== FINISH ================================"
sleep 30