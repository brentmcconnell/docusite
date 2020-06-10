#!/bin/bash

az login --service-principal -u $SP_NAME -p $SP_PASS --tenant $SP_TENANT

# Just check and see if the mount is there and has what we need
find /website

# Upload to Azure
az storage blob upload-batch \
 --destination \$web \
 --account-name "masteringk8s" \
 --source "/website/build/test-site"

echo "Say Bye Bye"
