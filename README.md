# Calcite

Calcite is a simple bootc image with GNOME.

## Pre-built image

You can use this: [`quay.io/charles2/calcite`](https://quay.io/repository/charles2/calcite).

## Building

```bash
sudo podman build -t calcite .
```

> [!TIP]
> If you want to use a different base distro, use the `--from=` parameter and specify another bootc base image.

## Deploying

You should be able to deploy it in most manners.

However Anaconda has a chance of not working properly and the system will fail to start.