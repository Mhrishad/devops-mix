# Since no profile is found, start Minikube:
minikube start --driver=docker
# This will start Minikube using Docker as the driver. If you're using VirtualBox or Hyper-V, use:

# powershell
minikube start --driver=virtualbox
# or
# powershell
minikube start --driver=hyperv

# Verify Minikube Status
minikube status

# Use Minikube's Docker Daemon
minikube docker-env | Invoke-Expression

# Build the Docker Image
docker build -t mhrishad-app:latest .

# Continue with Kubernetes Deployment
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml


# get ingress

kubectl get ingress
