all: kompose.yaml

kompose.yaml: compose.yaml
	kompose convert -o kompose.yaml

nerdctl-build:
	nerdctl --namespace k8s.io compose build

kubectl-apply: kompose.yaml nerdctl-build
	kubectl apply -f kompose.yaml
