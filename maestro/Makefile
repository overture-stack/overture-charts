# Make file for local development
install:
	helm install chart --name maestro
rollback:
	helm rollback maestro 1
delete:
	helm del --purge maestro