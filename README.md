# Calcite

Calcite is a simple bootc image with GNOME.

## Building

```bash
sudo podman build -t calcite --from=<BASE_IMAGE> .
```

- `<BASE_IMAGE>` can be any RHEL/Fedora-like bootc base image URL, for example `ghcr.io/charles25565/unified-bootc-images:r9`.