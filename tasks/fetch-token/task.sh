#!/bin/bash
echo "CONNECTING..."
./cfcr-git/bin/set_kubeconfig_from_concourse $DIRECTOR_NAME/cfcr https://$CFCR_MASTER_DNS:8443
echo "...CONNECTED!"

echo "FETCHING TOKEN..."
cat ~/.kube/config | grep token | awk '{print $2}' > token
echo "...DONE"

{
 IFS='' && echo $CREDHUB_CA | tee ca-cert
} &> /dev/null

credhub api $CREDHUB_URL --ca-cert ca-cert
credhub login
credhub set -n /concourse/main/cfcr-deployment/token -t value -v `cat token`
credhub logout

rm ca-cert
rm token
