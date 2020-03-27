# Overture Helm-charts
Repository to keep helm charts for the overture different projects 

## Maestro
See examples on how to use this chart in ./_examples

# How to package and publish:

- `helm package ./mychart # Turn a chart into a versioned chart archive file`
- then copy the chart to the charts-server repository (another git repository in overture-stack)
- then you need to reindex, see charts-server for instructions.
