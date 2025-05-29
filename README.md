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

> [!NOTE]
> If you are building using using RHEL Image Mode, make sure that your host is registered with `subscription-manager` before building.

## Deploying

You should be able to deploy it in any manner you like.

You can find an in depth installation guide using Anaconda [here](INSTALL.md).
