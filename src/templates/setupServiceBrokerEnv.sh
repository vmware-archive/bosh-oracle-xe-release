## Moving the endpoint and credentials to a separate script 
## so the env variables will override any bundled configurations
## Modified properties to have both host and port in the same oracle.host field
#export oracle_host=DB_HOST_ADDR
#export oracle_service=DB_SID
#export broker_datasource_url=jdbc:oracle:thin:@${oracle_host}:${oracle_service}
#export broker_datasource_username=DB_USER
#export broker_datasource_password=DB_PASSWD
## Using the same database for both persistence store and managing its service
#export dba_datasource_url=jdbc:oracle:thin:@${oracle_host}:${oracle_service}
#export dba_datasource_username=TARGET_ADMIN_USER
#export dba_datasource_password=TARGET_ADMIN_PASSWD
