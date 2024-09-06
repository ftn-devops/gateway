
# k8s Set Up

Have kubernetess running from Docker Desktop.

# Install HELM

First we need to instal HELM on our machine, you can follow instructions from official site : https://helm.sh/docs/intro/install/


for WINDOWS execute next command:
```bash
winget install Helm.Helm
```
for MacOS execute next command:
```bash
brew install helm
```

## Run Locally

Navigate to this 'k8s' floder and execute
```bash
  kubectl apply -R -f ./
```


## Checking

You can allways check what's happening in cluster with next commands:
```bash
  kubectl get pod
```
```bash
  kubectl get svc
```
etc ...


But my recommendation is to install VS Code extension 'kubernetes' for easy cluster manipulation


## Test your services

Currently you can only test your services with port-forward technique
```bash
  kubectl port-forward svc/audit 8804:8080
```
Until we have gateway configured right.
