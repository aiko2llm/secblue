#!/usr/bin/env bash

set -oue pipefail

#KERNEL_VERSION="$(rpm -q "kernel-cachyos-lto" --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')"

# Depends on word splitting
# shellcheck disable=SC2086
rm -r /usr/lib/modules/$(uname -r)/nvidia
