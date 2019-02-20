#!/bin/bash
set -x

./cfcr-git/bin/set_kubeconfig_from_concourse $DIRECTOR_NAME/cfcr https://$CFCR_MASTER_DNS:8443
