#!/usr/bin/env bash

readonly BINARY_NAME=ingress-controller-conformance.linux_arm64
readonly URL=https://raw.githubusercontent.com/pmalek/upload1/main/"${BINARY_NAME}"

set -ex
curl -O "${URL}"
chmod +x "${BINARY_NAME}"
./"${BINARY_NAME}" \
  -ingress-class kong \
  -wait-time-for-ingress-status 60s
