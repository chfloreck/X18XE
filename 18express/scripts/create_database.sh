dbca -silent -createDatabase \
-templateName XE_Database.dbc \
-gdbName mydb.darkwing.net \
-sid mydb \
-databaseConfigType SI \
-createAsContainerDatabase false \
-sysPassword Str0hdummer! \
-systemPassword Str0hdummer! \
-emConfiguration DBEXPRESS \
-emExpressPort 5500 \
-datafileDestination "/opt/oracle/data/data" \
-recoveryAreaDestination "/opt/oracle/data/fast" \
-recoveryAreaSize 0 \
-characterSet AL32UTF8 \
-redoLogFileSize 100 \
-enableArchive false \
-useOMF true \
-totalMemory 2048 \

