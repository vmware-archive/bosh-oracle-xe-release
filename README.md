# Bosh Oracle XE Release

Bosh Release for Oracle XE database.

`WORK IN PROGRESS NOT READY, FEW BUGS, NEEDS BETTER DOCUMENTATION AND REFACTORING. PULL REQUESTS WELCOME`	

This is a simple bosh release for installing and running Oracle XE database instance for purely dev purpose on Bosh managed infrastructure. The release would also deploy a co-located java based [Oracle Service Broker] [https://github.com/viniciusccarvalho/cf-oracle-servicebroker] app that would broker and manage the Oracle XE instance for use with Cloud Foundry based apps. This would create a new vm using the specified ip and install and create the Oracle XE instance and run the java service broker app connecting to the XE instance. Please refer to the service broker app for more details on managing and interacting with the app.

The Oracle XE install should be accessible for download.

## Setting up

Download the Oracle XE install binary and make it available on the network for download by Bosh.

Also, download the Oracle Thin JDBC Driver (version that would work with 11g or 12c DB release in jar file format) and make it available on the network for download by Bosh.

## Building the release

Steps to build the release and deploy it to bosh:

```
bosh -n delete deployment oracle-xe
bosh -n delete release oracle-xe
rm -rf releases/* .final_builds/* .dev_builds/*
bosh -n create release --name oracle-xe --version 11.2 --with-tarball --final
bosh -n upload release releases/oracle-xe/oracle-xe-11.2.tgz
```

## Download Oracle XE Binary install
Download the Oracle XE install binary and make it available on the network for download by Bosh.
Also, download the Oracle Thin JDBC Driver (version that would work with 11g or 12c DB release in jar file format) and make it available on the network for download by Bosh.

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
bosh -n deploy oracle-xe-bosh-lite.yml
```

## Deploy to vSphere
Edit the relevant bits inside the deployment file to correctly configure the Bosh Director UUID, network addresses, database host, port, service, user credentials as needed (look for EDIT ME tags) when deploying on VSphere.
```
bosh -n deploy oracle-xe-vsphere.yml
```


