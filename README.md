my-k8s-project/
│── terraform/                  # Terraform configuration for cluster provisioning
│   ├── main.tf                  # Main Terraform configuration
│   ├── variables.tf              # Variable definitions
│   ├── outputs.tf                # Output values
│   ├── provider.tf               # AWS provider configuration
│
│── helm-chart/                   # Helm chart for deploying app
│   ├── Chart.yaml                 # Helm chart metadata
│   ├── values.yaml                 # Helm values configuration
│   ├── secrets.yaml                # Helm secrets configuration
│   ├── templates/                   # Kubernetes manifests
│   │   ├── deployment.yaml         # App deployment definition
│   │   ├── service.yaml            # Service definition
│   │   ├── ingress.yaml            # Ingress configuration
│   │   ├── oauth2-proxy.yaml       # OAuth2 Proxy setup
│   │   ├── argocd.yaml             # ArgoCD setup
│
│── jenkins/                        # Jenkins automation
│   ├── Jenkinsfile                  # CI/CD pipeline script
│
│── scripts/                         # Additional utility scripts
│   ├── deploy.sh                     # Deployment helper script
│   ├── cleanup.sh                     # Cleanup script
│
│── README.md                         # Project documentation