all: kompose.yaml

kompose.yaml: compose.yaml
	kompose convert -o kompose.yaml

docker-build:
	docker compose build

kubectl-apply: kompose.yaml docker-build
	kubectl apply -f kompose.yaml
