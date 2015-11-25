#!/bin/sh

# For use to create final release tarball
VERSION=11.2
CREATE_FINAL_TARBALL=true
RELEASE_NAME=oracle-xe

echo "Cleanup previous release ..."
rm -rf releases/* .dev_builds/* .final_builds/*

echo "Creating the release ..."
bosh create release --force --name $RELEASE_NAME --version $VERSION

if [ "$CREATE_FINAL_TARBALL" == "true" ]; then
  # To create a final tarball release
  bosh -n create release --name $RELEASE_NAME --version $VERSION --with-tarball --final --force
fi

echo "Done creating the release ..."
