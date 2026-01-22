set -e
! podman manifest exists borg-serve || podman manifest rm borg-serve
podman manifest create -a borg-serve
podman build --platform=linux/arm64,linux/amd64 --manifest borg-serve .
podman manifest push --all borg-serve docker://docker.io/derkades/borg-serve
podman manifest rm borg-serve
