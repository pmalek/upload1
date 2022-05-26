#!/usr/bin/env bash

readonly URL=https://github.com/pmalek/upload1/raw/main/ingress-controller-conformance

set -ex
curl -O "${URL}"
./ingress-controller-conformance \
  -ingress-class kong \
  -wait-time-for-ingress-status 60s
