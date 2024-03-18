# Overture Helm-charts

Repository to keep helm charts for the overture projects.

# How to package and publish:

- Turn a chart into a versioned chart archive file

```
helm package ./mychart
```

- then copy the chart to the charts-server repository (another git repository in overture-stack)
- then you need to reindex — see charts-server for instructions.

# Upgrade notes

## Arranger

This app now uses Helm configMaps to store a few config files.
When the chart is deployed the following configmaps are created, containing these files:

### In Server (formerly API), `arranger-server-configs`

- base.json
- extended.json
- facets.json
- matchbox.json
- table.json

Each of these default to `{}`, and should customised by passing values into helm in the follwowing fashion

```
serverConfigs: {
  baseConfigs: `path/to/base.json`,
  extendedConfigs: `path/to/extended.json`,
  ...
}
```

### And in Admin UI, `arranger-nginx-config`

- nginx.conf
- env-config.js

| Customizable parameter     | Description       | Default |
| -------------------------- | ----------------- | ------- |
| `uiConfig.port`            | Nginx listen port | `""`    |
| `uiConfig.ReactAppBaseURL` | Base url          | `""`    |

Version 0.3.1

all `api<values>` are now just `<values>`:

Old:

    apiConfig:
      ...

    apiImage:
      ...

    apiIngress:
      ...

New:

    config:
      ...

    image:
      ...

    ingress:
      ...

also, new required config values:
config:
documentType: "" (i.e. graphql field; e.g. "file")
index: "" (i.e. Elasticsearch index/alias to query)

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

## DMS-ui

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

See examples on how to use this chart in ./\_examples

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

## Song

Version: 0.12.3

Allows using your own existing postgres instance.
Set `useInternalDep` as `false` to prevent starting a "song-postgres" pod.

New params: (and their default values)

    postgres:
      host: "song.fullname"-postgres.
      port: 5432
      secret:
        name: "song.fullname"-postgres
        key: postgres-password
      useInternalDep: true

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
