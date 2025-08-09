FROM quay.io/centos-bootc/centos-bootc:stream10
RUN --mount=type=bind,source=build.sh,target=/build.sh,relabel=shared /build.sh