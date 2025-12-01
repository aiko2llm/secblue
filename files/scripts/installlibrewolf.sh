#!/usr/bin/env bash

set -oue pipefail

curl -fsSL https://repo.librewolf.net/librewolf.repo -o /etc/yum.repos.d/librewolf.repo

rpm-ostree install librewolf
