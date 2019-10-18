ORACLE_SID=mydb
ORAENV_ASK=NO
. oraenv
RETVAL=`sqlplus -silent / as sysdba <<EOF
SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
SELECT 'Alive' FROM dual;
EXIT;
EOF`
date >> /tmp/alive.log
echo $RETVAL >> /tmp/alive.log
if [ "${RETVAL}" = "Alive" ]; then
  exit 0;
else
  exit 1;
fi
