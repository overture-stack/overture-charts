install:
	helm install maestro --name maestro

rollback:
	helm rollback maestro 1

delete:
	helm del --purge maestro