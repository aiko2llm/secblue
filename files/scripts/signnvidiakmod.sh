#!/usr/bin/env bash

set -oue pipefail

KERNEL_VERSION="$(rpm -q "kernel-cachyos-lto" --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')"

# Depends on word splitting
# shellcheck disable=SC2086
modinfo /usr/lib/modules/${KERNEL_VERSION}/nvidia/nvidia{,-drm,-modeset,-peermem,-uvm}.ko.zst >/dev/null ||
    (cat "/var/cache/akmods/nvidia/*.failed.log" && exit 1)

# View license information
# Depends on word splitting
# shellcheck disable=SC2086
modinfo -l /usr/lib/modules/${KERNEL_VERSION}/nvidia/nvidia{,-drm,-modeset,-peermem,-uvm}.ko.zst

./signmodules.sh "nvidia"
