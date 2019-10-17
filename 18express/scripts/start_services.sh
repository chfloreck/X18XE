ORACLE_SID=mydb
ORAENV_ASK=NO
. oraenv
cd
cd scripts
sqlplus / as sysdba @create_services.sql
