#!/usr/bin/env bash

readonly REPO_URL=https://raw.githubusercontent.com/pmalek/upload1
readonly BINARY_NAME=ingress-controller-conformance.linux_arm64
readonly BINARY_URL="${REPO_URL}"/main/"${BINARY_NAME}"
readonly FEATURES_DIR_URL="${REPO_URL}"/main/features

[ -d features ] || mkdir features
pushd features
curl -O "${FEATURES_DIR_URL}"/default_backend.feature
curl -O "${FEATURES_DIR_URL}"/host_rules.feature
curl -O "${FEATURES_DIR_URL}"/ingress_class.feature
curl -O "${FEATURES_DIR_URL}"/load_balancing.feature
curl -O "${FEATURES_DIR_URL}"/path_rules.feature
popd

set -ex
curl -O "${BINARY_URL}" && chmod +x "${BINARY_NAME}"
./"${BINARY_NAME}" \
  -ingress-class kong \
  -wait-time-for-ingress-status 60s
