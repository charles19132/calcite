# Installation with Anaconda

This guide assumes you are already on a Fedora 40+ or CentOS Stream 10+ system. Calcite itself won't work.

You also will already need to have a container image ready.

## Installing mkksiso, skopeo and curl

`mkksiso` is a tool used to inject kickstart files and other files into an Anaconda ISO. `curl` is a tool used for web related activities.

We need both of these.

```bash
sudo dnf install lorax util-linux skopeo curl -y
```

## Downloading the base ISO

This will download the base ISO, which will we add the container and kickstart.

```bash
curl -o base.iso https://mirror.stream.centos.org/10-stream/BaseOS/x86_64/iso/CentOS-Stream-10-latest-x86_64-boot.iso
```

## Saving the container

This will save the container.

```bash
podman save localhost/calcite:latest -o container --format oci-dir
```

## Creating the kickstart

Run the following to create ks.cfg.

```bash
cat > ks.cfg <<EOF
ostreecontainer --url /run/install/repo/container --transport oci --no-signature-verification

%post --erroronfail
bootc switch --mutate-in-place --transport registry quay.io/charles2/calcite:latest
%end
EOF
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

Note that the packages settings will be missing because `ostreecontainer` causes them to be hidden.
