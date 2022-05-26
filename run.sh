#!/usr/bin/env bash

readonly BINARY_NAME=ingress-controller-conformance
readonly URL=https://github.com/pmalek/upload1/raw/main/"${BINARY_NAME}"

set -ex
curl -O "${URL}"
chmod +x "${BINARY_NAME}"
./"${BINARY_NAME}" \
  -ingress-class kong \
  -wait-time-for-ingress-status 60s
