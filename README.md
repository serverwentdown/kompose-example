
# kompose-example

A simple Kompose example using the `tilt-avatars` sample app.

## Requirements

- [Kompose](https://kompose.io/)
- nerdctl (Provided by Rancher Desktop using containerd mode)
- A Kubernetes cluster (Provided by Rancher Desktop using containerd mode)

## Steps

1. Install Rancher Desktop in containerd mode
2. Forward `traefik` from port 80
   - `sudo sysctl net.ipv4.ip_unprivileged_port_start=0`
   - Open "Rancher Desktop" -> "Port Forwarding" -> check "Include Kubernetes services" and click "Forward" on "traefik" "web". Key in port "80"
   - You should be able to visit http://localhost and see a "404 page not found"
3. Run `nerdctl --namespace k8s.io compose build`
4. Run `kompose convert -o kompose.yaml`
5. Run `kubectl apply -f kompose.yaml`
6. Visit http://avatar.localdev.me

<!-- vim: set conceallevel=2 et ts=2 sw=2: -->
