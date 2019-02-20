#!/bin/bash
set -x
set -e

echo "CONNECTING..."
./cfcr-git/bin/set_kubeconfig_from_concourse $DIRECTOR_NAME/cfcr https://$CFCR_MASTER_DNS:8443
echo "...CONNECTED!"

echo "EXPORTING TOKEN..."
cat ~/.kube/config | grep token | awk '{print $2}' > k8s-token/token
echo "...DONE"

credhub api $CREDHUB_URL --skip-tls-validation
credhub login
