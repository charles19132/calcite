# Calcite

Calcite is a simple bootc image with GNOME.

> [!NOTE]
> While building an image against Fedora works, we recommend using [this image](https://quay.io/repository/fedora/fedora-silverblue) instead if you choose to do so.

## Pre-built image

You can use this: `ghcr.io/charles19132/calcite:main`.

## Building

```bash
sudo podman build -t localhost/calcite:latest .
```

> [!TIP]
> If you want to use a different base distro, use the `--from=` parameter and specify another bootc base image.

> [!NOTE]
> If you are building using RHEL Image Mode, make sure that your host is registered using `subscription-manager` before building.

## Deploying

You should be able to deploy it in any manner you like.

You can find an in depth installation guide using Anaconda [here](INSTALL.md).
