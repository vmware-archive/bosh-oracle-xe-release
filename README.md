# Bosh Oracle XE Release (Experimental)

Bosh Release for Oracle XE development database (Experimental)

`WORK IN PROGRESS NOT READY, FEW BUGS, NEEDS BETTER DOCUMENTATION AND REFACTORING. PULL REQUESTS WELCOME`	

This is a simple bosh release for installing and running Oracle XE database instance for purely dev purpose on Bosh managed infrastructure. The release would also deploy a co-located java based [Oracle Service Broker] (https://github.com/viniciusccarvalho/cf-oracle-servicebroker) app that would broker and manage the Oracle XE instance for use with Cloud Foundry based apps. This would create a new vm using the specified ip and install and create the Oracle XE instance and run the java service broker app connecting to the XE instance. Please refer to the service broker app for more details on managing and interacting with the app. Both the XE instance and the bundled service broker would be managed by Bosh and not CF.

Both the Oracle XE install binary and Oracle jdbc thin driver should be accessible for download.

## Setting up

Download the [Oracle XE Install] ( http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html) for Linux x64 bit version and make it available on the network for download by Bosh.

Also, download the [Oracle Thin JDBC Driver] (http://www.oracle.com/technetwork/database/enterprise-edition/jdbc-112010-090769.html) version that would work with 11g or 12c DB release (named ojdbc\* in jar file format) and make it available on the network for download by Bosh.

## Building the release

Steps to build the release and deploy it to bosh manually:

```
bosh -n delete deployment oracle-xe
bosh -n delete release oracle-xe
rm -rf releases/* .final_builds/* .dev_builds/*
bosh -n create release --name oracle-xe --version 11.2 --with-tarball --final
bosh -n upload release releases/oracle-xe/oracle-xe-11.2.tgz
```
Or use the createRelease.sh script (modify as necessary) to create the releease, followed by deployRelease (use the appropriate deployment manifest and edit the director UUID and otehr stuch configurations).

## Download Oracle XE Binary install
Download the Oracle XE install binary for Linux x64 platform and make it available on the network for download by Bosh.
Also, download the Oracle Thin JDBC Driver version that would work with 11g or 12c DB release (in jar file format) and make it available on the network for download by Bosh.

Edit the xe_install_download_url to point to the correct location of the XE binary install (in rpm format) in the bosh deployment plan under properties -> oracle_xe section.
Edit the jdbc_driver_download_url to point to the correct location of the jdbc driver (in jar format) in the bosh deployment plan under properties -> oracle_xe_sb section.

```
properties:
  oracle_xe:
    xe_install_download_url: "http://12.1.1.1:7777/fileserver/oracle-xe/oracle-xe-11.2.0-1.0.x86_64.rpm.zip" 
    .....
  oracle_xe_sb:
    jdbc_driver_download_url: "http://12.1.1.1:7777/fileserver/oracle-xe/ojdbc7.jar"  
```

## Deploy to Bosh-lite
As mentioned previously, edit the relevant bits inside the deployment file to correctly configure the Bosh Director UUID, network addresses, database host, port, service, user credentials as needed (look for EDIT ME tags).
```
bosh -n deploy oracle-xe-boshlite.yml
```

## Deploy to vSphere
Edit the relevant bits inside the deployment file to correctly configure the Bosh Director UUID, network addresses, database host, port, service, user credentials as needed (look for EDIT ME tags) when deploying on VSphere.
```
bosh -n deploy oracle-xe-vSphere.yml
```

## Create Oracle XE Ops Manager Tile
Edit the relevant bits inside the oracle-xe-tile.yml file if necessary and then run the createTile.sh script to generate the tile.
The script would download the bosh vSphere Centos stemcell, pull the release tarball and the tile to create the `.pivotal` file.
Import the .pivotal tile into Ops Manager.


