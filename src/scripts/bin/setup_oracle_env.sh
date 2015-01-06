cp /etc/skel/.bash_logout ~oracle
cp /etc/skel/.bashrc ~oracle
cp /etc/skel/.profile ~oracle

echo "" >>~oracle/.profile
# Try to use find against '/u01/', rather than '/u01', 
# as '/u01' is a symbolic link  and find will stop on encountering symbolic link
ORACLE_ENV_SH=`find /u01/ -name oracle_env.sh`
ORACLE_HOME=`dirname $ORACLE_ENV_SH`/..
echo ". ${ORACLE_ENV_SH}" >> ~oracle/.profile

chown -R oracle:dba ~oracle/*
