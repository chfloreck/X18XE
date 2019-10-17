export ORACLE_SID=mydb
export ORACLE_BASE=/opt/oracle
export ORACLE_HOME=/opt/oracle/product/18c/dbhomeXE/
export PATH=$PATH:$HOME/.local/bin:$HOME/bin:$ORACLE_HOME/bin


echo "******************************************************************************"
echo "Handle shutdowns." `date`
echo "docker stop --time=30 {container}" `date`
echo "******************************************************************************"

function gracefulshutdown {
  dbshut $ORACLE_HOME
}


trap gracefulshutdown SIGINT
trap gracefulshutdown SIGTERM
trap gracefulshutdown SIGKILL


dbstart $ORACLE_HOME


ORACLE_SID=mydb
ORAENV_ASK=NO
. oraenv
sqlplus / as sysdba @/home/oracle/scripts/start_services.sql
tail -f ${ORACLE_BASE}/diag/rdbms/${ORACLE_SID}/${ORACLE_SID}/trace/alert_${ORACLE_SID}.log &

bgPID=$!
wait $bgPID

