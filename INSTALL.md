# Installation with Anaconda

This guide assumes you are already on a Fedora 40+ or EL10+ system. Calcite itself won't work.

## Installing mkksiso, skopeo and curl

`mkksiso` is a tool used to inject kickstart files and other files into an Anaconda ISO and `skopeo` is a tool used to manage a container image remote. `curl` is a tool used for web related activities.

We need both of these.

```bash
sudo dnf install lorax util-linux skopeo curl --allowerasing -y
```

## Downloading the base ISO

This will download the base ISO, which will we add the container and kickstart.

```bash
curl -o base.iso https://download.rockylinux.org/pub/rocky/10/isos/x86_64/Rocky-10-latest-x86_64-boot.iso
```

## Downloading the container

This will download the container using skopeo.

```bash
skopeo copy docker://ghcr.io/charles25565/calcite:latest oci:container
```

## Creating the kickstart

Run the following to create ks.cfg.

```bash
cat > ks.cfg <<EOF
ostreecontainer --url /run/install/repo/container --transport oci --no-signature-verification

%post --erroronfail
bootc switch --mutate-in-place --transport registry ghcr.io/charles25565/calcite:latest
%end
EOF
```

## Building the ISO

Now that we have everything ready, we can build the ISO image.

```bash
sudo mkksiso -a container ks.cfg base.iso calcite.iso
```

## Flashing the ISO

You can use your favorite tool to flash the ISO we have created. If you are using a virtual machine, you can skip this.

## Installing using the ISO

After booting the ISO, you can now install it like any other EL-like distro.

Note that the packages settings will be missing because `ostreecontainer` causes them to be hidden.
