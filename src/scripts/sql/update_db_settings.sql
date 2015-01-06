exec dbms_xdb.setlistenerlocalaccess (false);

alter system set local_listener = '(ADDRESS=(PROTOCOL=TCP)(HOST=XE_HOST_IP)(PORT=XE_HOST_PORT))' scope=both;

alter system register;

alter system set sessions=200 scope=spfile;
alter system set processes=200 scope=spfile;

shutdown immediate;
startup;

exit

