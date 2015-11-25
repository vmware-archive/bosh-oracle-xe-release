#!/bin/sh

function usage() {
  echo "Error!! Needs an arguments: <Path to Blob file> "
  echo ""
  echo "Example: ./addOracleServiceBrokerBlob.sh path-to-oracle-service-broker.jar "
  echo "This would add the 'oracle-service-broker.jar' as blob under 'blobs/oracle_service_broker' "
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

bosh -n add blob $givenBlobFile oracle_service_broker
bosh -n upload blobs

echo "Note: Update the packages/oracle_service_broker/spec file if the name of the jar file is not oracle-service-broker-0.1.0.jar"
echo " The spec file entry to be changed would be '- oracle_service_broker/oracle-service-broker-0.1.0.jar' "
echo ""
