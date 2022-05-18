# Overture Helm-charts
Repository to keep helm charts for the overture different projects

## Maestro
See examples on how to use this chart in ./_examples

# How to package and publish:

- `helm package ./mychart # Turn a chart into a versioned chart archive file`
- then copy the chart to the charts-server repository (another git repository in overture-stack)
- then you need to reindex, see charts-server for instructions.

## Arranger

Arranger now uses configmaps to store nginx config files. When the chart is deployed `arranger-nginx-config` configmap is created with these files:

  nginx.conf
  env-config.js


#### Arranger Parameters

| Name                        | Description                                     | Value |
| -------------------------   | ----------------------------------------------- | ----- |
| `uiConfig.port`             | Nginx listen port                               | `""`  |
| `uiConfig.ReactAppBaseURL`  | Base url                                        | `""`  |


## Upgrade notes

## Arranger

Version: 0.3.0

Values for ingress config changed:

Old:

    apiIngress:
      enabled: true
      host: host.local

    uiIngress:
      enabled: true
      host: host.local

New:

    apiIngress:
      enabled: true
      hosts:
        - host: host.local
          paths:
            - path: /
              pathType: ImplementationSpecific

    uiIngress:
      enabled: true
      hosts:
        - host: host.local
          paths:
            - path: /
              pathType: ImplementationSpecific


## Dms-ui
Version: 1.1.0

Old:

    ingress:
      enabled: true
      hosts:
      - host.local

New:

    ingress:
      enabled: true
      hosts:
        - host: host.local
          paths:
            - path: /
              pathType: ImplementationSpecific


## Ego
Version: 3.1.0

Old:

    ingressApi:
      enabled: true
      host: host.local

    ingressUi:
      enabled: true
      host: ui.host.local

New:

    ingressApi:
      enabled: true
      hosts:
        - host: ego.local
          paths:
            - path: /api/(.*)
              pathType: ImplementationSpecific

    ingressUi:
      enabled: true
      hosts:
        - host: ui.ego.local
          paths:
            - path: /
              pathType: ImplementationSpecific



## Lectern
Version: 0.7.0

Old:

    ingress:
      enabled: true
      hosts:
      - host.local

New:

    ingress:
      enabled: true
      hosts:
        - host: host.local
          paths:
            - path: /
              pathType: ImplementationSpecific

## Maestro
Version: 0.9.0

Old:

    ingress:
      enabled: true
      hosts:
      - host.local

New:

    ingress:
      enabled: true
      hosts:
        - host: host.local
          paths:
            - path: /
              pathType: ImplementationSpecific

### Muse
Version: 0.10.0

Old:

    ingress:
      enabled: true
      hosts:
      - host.local

New:

    ingress:
      enabled: true
      hosts:
        - host: host.local
          paths:
            - path: /
              pathType: ImplementationSpecific

### Rollcall

Version: 1.5.0

Old:

    ingress:
      enabled: true
      hosts:
      - host.local

New:

    ingress:
      enabled: true
      hosts:
        - host: host.local
          paths:
            - path: /
              pathType: ImplementationSpecific

## Score

Version:  0.12.0

Old:

    ingress:
      enabled: true
      hosts:
      - host.local

New:

    ingress:
      enabled: true
      hosts:
        - host: host.local
          paths:
            - path: /
              pathType: ImplementationSpecific

## Song

Version: 0.12.0

Old:

    ingress:
      enabled: true
      hosts:
      - host.local

New:

    ingress:
      enabled: true
      hosts:
        - host: host.local
          paths:
            - path: /
              pathType: ImplementationSpecific
## Stateless-svc 

Version: 0.1.0

Old:

    ingress:
      enabled: true
      hosts:
      - host.local

New:

    ingress:
      enabled: true
      hosts:
        - host: host.local
          paths:
            - path: /
              pathType: ImplementationSpecific
