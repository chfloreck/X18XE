startup;
BEGIN
  DBMS_SERVICE.create_service(
    service_name => 'mydb_srv1',
    network_name => 'mydb_srv1'
  );
END;
/
BEGIN
  DBMS_SERVICE.create_service(
    service_name => 'mydb_srv2',
    network_name => 'mydb_srv2'
  );
END;
/
shutdown IMMEDIATE;
exit;
