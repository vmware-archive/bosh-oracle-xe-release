#!/bin/sh

# Cleanup existing deployment and release
CLEAN_UP=true

# For use to create final release tarball
RELEASE_NAME=oracle-xe

DEPLOYMENT_NAME=oracle-xe
DEPLOYMENT_PLATFORM=boshlite
#DEPLOYMENT_PLATFORM=vSphere
DEPLOYMENT_MANIFEST=`pwd`/oracle-xe-${DEPLOYMENT_PLATFORM}.yml

if [ "$CLEAN_UP" == "true" ]; then
  bosh deployment $DEPLOYMENT_MANIFEST
  bosh -n delete deployment $DEPLOYMENT_NAME
  bosh -n delete release $RELEASE_NAME
fi

# Make sure the release has already been uploaded
#bosh -n upload release; 
#echo "Done uploading the release ..."

bosh -d $DEPLOYMENT_MANIFEST -n deploy
echo "Done deploying ..."

