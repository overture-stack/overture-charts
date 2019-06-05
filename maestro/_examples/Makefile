# Make file for local development
POD_NAME=$(shell KUBECONFIG="`kind get kubeconfig-path --name="kind"`" kubectl get pods --namespace default -l "app.kubernetes.io/name=maestro,app.kubernetes.io/instance=maestro" -o jsonpath="{.items[0].metadata.name}")
PORT=80

start-cluster:
	./start-helm-cluster.sh

nuke:
	kind delete cluster

install:
	helm install ../. --name maestro

rollback:
	helm rollback maestro 1

delete:
	helm del --purge maestro

example-template:
	helm template --values ./provide-env/values.yaml ../.

run-example-provide-env:
	docker-compose -f docker-compose.dev.yml up -d
	helm upgrade --install maestro --values ./provide-env/values.yaml ../.

pod_yaml:
	kubectl get pod $(POD_NAME) -o yaml

pvc_yaml:
	kubectl get pvc maestro-error-logs-claim -o yaml

# this needs its own tab
expose:
	kubectl port-forward $(POD_NAME) 5656:$(PORT)

ping:
	curl http://localhost:5656/
	@echo

index-analysis:
	curl -X POST http://localhost:5656/index/repository/collab/study/PEME-CA/analysis/EGAZ00001254368

index-bad-analysis:
	curl -X POST http://localhost:5656/index/repository/collab/study/PEME-CA/analysis/EGAZ0000125436

sh:
	kubectl exec -it $(POD_NAME) sh

errors:
	kubectl exec $(POD_NAME) cat /app-data/failures.log

logs:
	kubectl logs $(POD_NAME)