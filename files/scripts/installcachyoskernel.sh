#!/usr/bin/env bash

set -oue pipefail

rpm-ostree initramfs --disable
depmod -a
rpm-ostree override remove kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra --install kernel-cachyos-lto
rpm-ostree install scx-scheds scx-tools cachyos-settings
