# BOSH Oracle XE Release (Experimental)

BOSH Release for Oracle XE development database (Experimental)

`WORK IN PROGRESS NOT READY, FEW BUGS, NEEDS BETTER DOCUMENTATION AND REFACTORING. PULL REQUESTS WELCOME`	

This is a bosh release for installing and running Oracle XE database instance for purely dev purpose on BOSH managed infrastructure. The release would also deploy a Java based [Oracle Service Broker] (https://github.com/viniciusccarvalho/cf-oracle-servicebroker) app that would broker and manage the Oracle XE instance for use with Cloud Foundry based apps. BOSH would manage the creation of a new vm and installation/management of the Oracle XE instance. Bosh would also push the Java based service broker app on CF connecting to the XE instance. Please refer to the service broker app for more details on managing and interacting with the app. The XE instance would be managed by BOSH while the bundled service broker would be managed by CF.

The Oracle XE install binary should be accessible for download from BOSh.

## Setting up

Download the [Oracle XE Install] ( http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html) for Linux x64 bit version and make it available on the network for download by Bosh.

## Adding the sources

### Run fetch_cf_cli.sh script to download and add the cf linux binary as a blob to the BOSH release

### Add the Oracle service broker app next as a blob using addOracleServiceBrokerBlob.sh
```
# Build the service broker app using the sources in the service-broker-srcs
# Install the ojdbc driver using the install-jar.sh script
# Use the build.gradle file bundled in the sources to build the service broker jar file
./addOracleServiceBrokerBlob.sh oracle-service-broker-0.1.0.jar
```

### Add the Subway service broker app next as a blob using addSubwayServiceBrokerBlob.sh
```
# 
# Use the modified version (to support https & non-verify) of subway available under service-broker-srcs
# or download the subway servicebroker code from https://github.com/cloudfoundry-community/cf-subway
# Add the subway zip file
./addSubwayServiceBrokerBlob.sh cf-subway.zip

``` 

## Build the release

Use the scripts to build the Oracle-XE release and Tile. Edit the scripts to rename the release or tile or versions.

```
./createRelease.sh

```

## Create the Tile
Edit the relevant bits inside the oracle-xe-tile-v1.5.yml file if necessary and then run the createTile.sh script to generate the tile.
Import the .pivotal tile into Dev Ops Manager instance (non-Production env)
* Important: Backup Ops Manager configurations before proceeding with import of the new tile to recover in case of errors.


