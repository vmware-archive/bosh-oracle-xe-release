# Moving the endpoint and credentials to a separate script 
# so the env variables will override any bundled configurations
export oracle_host=XE_HOST_ADDR
export oracle_port=XE_HOST_PORT
export oracle_service=XE_SERVICE_SID
export broker_datasource_url=jdbc:oracle:thin:@${oracle_host}:${oracle_port}:${oracle_service}
export broker_datasource_username=XE_SB_USER
export broker_datasource_password=XE_SB_PASSWD
export dba_datasource_url=jdbc:oracle:thin:@${oracle_host}:${oracle_port}:${oracle_service}
export dba_datasource_username=XE_ADMIN_USER
export dba_datasource_password=XE_ADMIN_PASSWD
