
# kompose-example

A simple Kompose example using the `tilt-avatars` sample app.

## Requirements

- [Kompose](https://kompose.io/)
- Docker/Rancher Desktop
  - Rancher Desktop requires less setup
- A Kubernetes cluster (Provided by Docker/Rancher Desktop)
- An ingress (Provided by Rancher Desktop)

## Steps (Docker Desktop)

1. Install Docker Desktop
2. Enable Kubernetes in Docker Desktop
3. Install [Helm](https://helm.sh/docs/intro/install/) and [kubectl](https://kubernetes.io/docs/tasks/tools/)
4. Install [Traefik Proxy](https://doc.traefik.io/traefik/getting-started/install-traefik/#use-the-helm-chart)
   - `helm repo add traefik https://traefik.github.io/charts && helm repo update && helm install traefik traefik/traefik`

## Steps (Rancher Desktop)

1. Install Rancher Desktop in dockerd mode
2. Forward `traefik` from port 80
   - `sudo sysctl net.ipv4.ip_unprivileged_port_start=0` (Only needed on Linux)
   - Open "Rancher Desktop" -> "Port Forwarding" -> check "Include Kubernetes services" and click "Forward" on "traefik" "web". Key in port "80"
   - You should be able to visit http://localhost and see a "404 page not found"

## Run

3. Run `docker compose build`
4. Run `kompose convert -o kompose.yaml`
5. Run `kubectl apply -f kompose.yaml`
6. Visit http://avatar.localdev.me

<!-- vim: set conceallevel=2 et ts=2 sw=2: -->
