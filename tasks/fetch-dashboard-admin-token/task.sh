#!/bin/bash
set -x
echo "CONNECTING..."
./cfcr-git/bin/set_kubeconfig_from_concourse $DIRECTOR_NAME/cfcr https://$CFCR_MASTER_DNS:8443
echo "...CONNECTED!"

echo "FETCHING TOKEN..."
./cfcr-git/imports/user/retrieveAdminServiceAccountBearerToken.sh
echo "...DONE"
