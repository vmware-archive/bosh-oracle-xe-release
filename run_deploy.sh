#!/bin/sh

# Cleanup existing deployment and release
CLEAN_UP=true

# For use to create final release tarball
CREATE_FINAL_TARBALL=true
VERSION=11.2
RELEASE_NAME=oracle-xe

PLATFORM=warden
#PLATFORM=vsphere

DEPLOYMENT_NAME=oracle-xe-${PLATFORM}
DEPLOYMENT_MANIFEST=`pwd`/oracle-xe-${PLATFORM}-manifest.yml

if [ "$CLEAN_UP" == "true" ]; then
  bosh deployment $DEPLOYMENT_MANIFEST
  bosh -n delete deployment $DEPLOYMENT_NAME
  bosh -n delete release $RELEASE_NAME
fi

echo "Creating the release ..."
bosh create release --force; 


echo "Done creating the release ..."
bosh -n upload release; 
echo "Done uploading the release ..."
bosh -d $DEPLOYMENT_MANIFEST -n deploy
echo "Done deploying ..."


if [ "$CREATE_FINAL_TARBALL" == "true" ]; then
  # To create a final tarball release
  bosh -n create release --name $RELEASE_NAME --version $VERSION --with-tarball --final --force
fi
