#!/bin/sh

TILE_NAME=Oracle-XE-Experimental
TILE_FILE=`pwd`/*tile.yml
RELEASE_TARFILE=`pwd`/releases/*/*.tgz
BOSH_STEMCELL_FILE=bosh-stemcell-2690.2-vsphere-esxi-centos-go_agent.tgz
BOSH_STEMCELL_LOCATION=https://s3.amazonaws.com/bosh-jenkins-artifacts/bosh-stemcell/vsphere

mkdir -p tmp
pushd tmp
mkdir -p metadata releases stemcells
cp $TILE_FILE metadata
cp $RELEASE_TARFILE releases
if [ ! -e "stemcells/$BOSH_STEMCELL_FILE" ]; then
  curl -k $BOSH_STEMCELL_LOCATION/$BOSH_STEMCELL_FILE -o stemcells/$BOSH_STEMCELL_FILE
fi
zip -r $TILE_NAME.pivotal metadata releases stemcells
mv $TILE_NAME.pivotal ..
popd
