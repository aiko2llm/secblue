#!/usr/bin/env bash

set -oue pipefail

rpm-ostree install kernel-cachyos-lto kernel-cachyos-lto-devel-matched
depmod -a
