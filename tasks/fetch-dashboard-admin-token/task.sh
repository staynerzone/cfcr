#!/bin/bash
echo "CONNECTING..."
./cfcr-git/bin/set_kubeconfig_from_concourse $DIRECTOR_NAME/cfcr https://$CFCR_MASTER_DNS:8443
echo "...CONNECTED!"

curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

echo "FETCHING TOKEN..."
./cfcr-git/imports/user/retrieveAdminServiceAccountBearerToken.sh
echo "...DONE"
