/* The tablespace filename should be within single quotes */

create tablespace XE_DEFAULT_TABLESPACE_NAME datafile '/u01/app/oracle/oradata/XE/XE_DEFAULT_TABLESPACE_NAME.dbf'  size XE_DEFAULT_TABLESPACE_SIZEM extent management local autoallocate;

create user XE_DEFAULT_USER identified by XE_DEFAULT_PASSWD default tablespace XE_DEFAULT_TABLESPACE_NAME;

alter user XE_DEFAULT_USER quota unlimited on XE_DEFAULT_TABLESPACE_NAME;

create role adminrole;
grant create sequence to adminrole;
grant create session to adminrole;
grant create synonym to adminrole;
grant create table to adminrole;
grant create trigger to adminrole;
grant create type to adminrole;
grant create procedure to adminrole;
grant alter any table to adminrole;
grant alter any procedure to adminrole;
grant drop any table to adminrole;
grant drop any view to adminrole;
grant drop any procedure to adminrole;
grant drop any sequence to adminrole;
grant drop any synonym to adminrole;
grant drop any trigger to adminrole;
grant drop any type to adminrole;
grant unlimited tablespace to adminrole;
#grant create session, create table, create view, create procedure, create synonym, create trigger, create sequence, create type, alter any table, alter any procedure, drop any table, drop any view, drop any procedure, drop any synonym, drop any trigger, drop any sequence, drop any type to adminrole;

grant adminrole to XE_DEFAULT_USER;

exit
