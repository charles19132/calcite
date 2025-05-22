# Installation

This guide assumes you are already on a Fedora 40+ or CentOS Stream 10+ system. Calcite itself won't work.

## Installing mkksiso and skopeo

`mkksiso` is a tool used to inject kickstart files and other files into an Anaconda ISO and `skopeo` is a tool used to manage a container image remote.

We need both of these.

```bash
sudo dnf install lorax util-linux skopeo
```

## Downloading the base ISO

This will download the base ISO, which will we add the container and kickstart.

```bash
curl -o base.iso https://mirror.stream.centos.org/10-stream/BaseOS/x86_64/iso/CentOS-Stream-10-latest-x86_64-boot.iso
```

## Downloading the container

This will download the container using skopeo.

```bash
skopeo copy docker://quay.io/charles2/calcite:latest oci:container
```

## Creating the kickstart

Paste the following into a new file called `ks.cfg`.

```
ostreecontainer --url /run/install/repo/container --transport oci --no-signature-verification

%post --erroronfail
bootc switch --mutate-in-place --transport registry quay.io/charles2/calcite:latest
%end
```

## Building the ISO

Now that we have everything ready, we can build the ISO image.

```bash
mkksiso -a container ks.cfg base.iso calcite.iso
```

## Flashing the ISO

You can use your favorite tool to flash the ISO we have created. If you are using a virtual machine, you can skip this.

## Installing using the ISO

After booting the ISO, you can now install it like any other EL-like distro.

Note that the packages settings will be missing.
