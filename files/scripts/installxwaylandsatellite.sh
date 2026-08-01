#!/usr/bin/env bash

set -oue pipefail

curl -fsSL https://github.com/terrapkg/subatomic-repos/raw/main/terra.repo -o /etc/yum.repos.d/terra.repo
dnf -y install terra-release

dnf -y install xwayland-satellite

# I also want other packages distributed by terra
rm -f /etc/yum.repos.d/terra.repo
