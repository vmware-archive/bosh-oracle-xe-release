#!/bin/sh

function usage() {
  echo "Error!! Needs an arguments: <Path to Blob file> "
  echo ""
  echo "Example: ./addSubwayServiceBrokerBlob.sh path-to-subway.zip "
  echo "This would add the 'cf-subway.zip' as blob under 'blobs/cf_subway' "
  echo ""
}

if [ "$#" -lt 1 ]; then
  usage
  exit -1
fi

givenBlobFile=$1

# The path to the file can have other directories
# Trim the directories
blobFile=`echo $givenBlobFile | awk  -F '/' '{print $NF } '`

bosh -n add blob $givenBlobFile cf_subway
bosh -n upload blobs

echo "Note: Update the packages/subway_service_broker/spec file if the name of the zip file is not cf-subway.zip"
echo " The spec file entry to be changed would be '- cf_subway/cf-subway.zip' "
echo ""
