#!/bin/sh

function usage() {
  echo "Error!! Needs 2 arguments: <Path to Blob file> <Directory or folder under ./blobs to save it>"
  echo ""
  echo "Example: ./addBlob.sh my-service-broker.jar oracle_xe-service-broker "
  echo "This would add the 'my-service-broker.jar' as blob under 'blobs/oracle_xe-service-broker' "
  echo ""
}

if [ "$#" -lt 2 ]; then
  usage
  exit -1
fi

givenBlobFile=$1

# The path to the file can have other directories
# Trim the directories
blobFile=`echo $givenBlobFile | awk  -F '/' '{print $NF } '`
blobPath=$2

bosh -n add blob $givenBlobFile $blobPath
bosh -n upload blobs

