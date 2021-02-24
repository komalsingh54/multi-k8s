# Muti Container Kubernetes

## GKE Deployment

  1. Create cluster in google cloud name: multi-cluster
  2. In cloud SSH  follow below commands 
     `gcloud config set project=<project-id>`
     `gcloud config set compute/zone <Zone-Id>`
     `gcloud container clusters <cluster-name>`
   3. In you google cloud console - install helm
      `curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3`
      `chmod 700 get_helm.sh`
      `./get_helm.sh`
   4. Install Ingress-Nginx:
      `helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx`
      `helm install my-release ingress-nginx/ingress-nginx`
   
   
Create Secret if any
  `kubectl create secret generic pgpassword --from-literal=PGPASSWORD=password`
