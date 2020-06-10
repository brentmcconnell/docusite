#!/bin/bash

usage() { 
    echo "`basename $0`"
    echo "   Usage: " 
    echo "     [-n: Name of service principal"
    echo "     [-p: Password of service principal"
    echo "     [-t: Tenant ID of service principal"
    exit 1
}

while getopts n:t:p: option
do
    case "${option}"
    in
        n) SP_NAME=${OPTARG};;
        p) SP_PASS=${OPTARG};;
        t) SP_TENANT=${OPTARG};;
        *) usage;;
        : ) usage;;
    esac
done
shift "$(($OPTIND -1))

az login --service-principal -u $SP_NAME -p "$SP_PASS" --tenant $SP_TENANT

# Just check and see if the mount is there and has what we need
find /website

# Upload to Azure
az storage blob upload-batch \
 --destination \$web \
 --account-name "masteringk8s" \
 --source "/website/build/test-site"

echo "Say Bye Bye"
