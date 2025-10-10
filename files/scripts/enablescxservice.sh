#!/usr/bin/env bash

set -oue pipefail

# https://github.com/sched-ext/scx/blob/main/services/systemd/README.md
systemctl enable scx_loader.service
