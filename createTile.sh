#!/bin/sh

TILE_VERSION=1.5
TILE_MANIFEST_FILE=`pwd`/*tile-v${TILE_VERSION}.yml
TILE=Oracle-XE-Broker-v0.1-OpsMgrv${TILE_VERSION}.pivotal
RELEASE_TARFILE=`pwd`/releases/*/*.tgz

mkdir -p tmp
pushd tmp
#Dont bundle the stemcell into the .pivotal Tile file as the stemcell must already be available in the Ops Mgr or needs to be imported
mkdir -p metadata releases 
cp $TILE_MANIFEST_FILE metadata
cp $RELEASE_TARFILE releases

# Ignore bundling the stemcell as most often the Ops Mgr carries the stemcell.
# If Ops Mgr complains of missing stemcell, change the version specified inside the tile to the one that Ops mgr knows about

#if [ ! -e "stemcells/$BOSH_STEMCELL_FILE" ]; then
#  curl -k $BOSH_STEMCELL_LOCATION/$BOSH_STEMCELL_FILE -o stemcells/$BOSH_STEMCELL_FILE
#fi
zip -r ${TILE} metadata releases 
mv ${TILE} ..
popd
