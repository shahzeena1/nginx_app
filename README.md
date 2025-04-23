# WebApp Helm Chart with OAuth2 Proxy Authentication

This Helm chart deploys a simple NGINX web application protected by [OAuth2 Proxy](https://oauth2-proxy.github.io/oauth2-proxy/) using GitHub authentication. It includes a Kubernetes Ingress resource for external access and is designed to work with Argo CD for GitOps-based continuous delivery.

---

## 📌 Purpose

This chart aims to:
- Deploy an NGINX-based web application to a Kubernetes cluster.
- Protect the web app behind OAuth2 Proxy with GitHub authentication.
- Use Argo CD for automated GitOps-based deployment.
- Secure credentials using `SOPS`-encrypted `values.yaml` files.

---

## 📁 Chart Structure

- `Deployment` and `Service` for:
- `webapp` (NGINX container)
- `oauth2-proxy` (OAuth2 Proxy)
- `Ingress` rule for routing traffic to OAuth2 Proxy.
- `Argo CD Application` manifest for GitOps-based deployment.
- `values.yaml` to configure images, ports, replicas, secrets, and domain.

---

## ✅ Prerequisites

Make sure the following are installed and configured:

1. **Helm v3+**
2. **Kubernetes Cluster** (local like Minikube/kind or cloud like EKS)
3. **Argo CD** (installed in your cluster)
4. **NGINX Ingress Controller**
5. **SOPS** for secret encryption/decryption
6. **GPG key** added to your local GPG agent for use with SOPS
7. **GitHub OAuth App** with callback URL set to `http://localhost:4180/oauth2/callback`

---

##  Secret Management using SOPS

To manage secrets securely using SOPS:

### Encrypt `values.yaml` using helm-seret sops,

Encrypt only the sensitive part (e.g., `clientID`, `clientSecret`, `cookieSecret`):

```bash
sops -e --output values.enc.yaml values.yaml
sops -d values.enc.yaml > values.yaml
```
## Install Chart
### Option 1: Install with Helm (for local dev)
```
helm repo add nginx_app https://github.com/shahzeena1/nginx_app
helm install webapp ./charts/webapp -f values.yaml
```
## Option 2: Install with Argo CD (GitOps)
Ensure Argo CD is running, then apply the Argo CD Application manifest:
```
kubectl apply -f argocd-app.yaml
```
## Testing, If using Minikube or kind:
### Port Forward to OAuth2 Proxy:
```
kubectl port-forward svc/oauth2-proxy 4180:4180
```
### Visit in Browser:
```
http://localhost:4180
```
