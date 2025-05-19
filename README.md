# Calcite

Calcite is a simple bootc image with GNOME.

## Building

```bash
sudo podman build -t calcite --from=<BASE_IMAGE> .
```

- `<BASE_IMAGE>` can be any RHEL/Fedora-like bootc base image URL, for example `ghcr.io/charles25565/unified-bootc-images:r9`.

## Deploying

You should be able to deploy it in most manners.

However Anaconda has a chance of not working properly and the system will fail to start.