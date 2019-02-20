#!/bin/bash
set -x
set -e

echo "CONNECTING..."
./cfcr-git/bin/set_kubeconfig_from_concourse $DIRECTOR_NAME/cfcr https://$CFCR_MASTER_DNS:8443
echo "...CONNECTED!"

echo "EXPORTING TOKEN..."
cat ~/.kube/config | grep token | awk '{print $2}' > k8s-token/token
echo "...DONE"

{
 IFS='' && echo $CREDHUB_CA_CERT | tee ca-cert
} &> /dev/null

credhub api $CREDHUB_URL --ca-cert ca-cert
credhub login
