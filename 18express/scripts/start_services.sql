BEGIN
  DBMS_SERVICE.start_service(
    service_name => 'mydb_srv1'
  );
END;
/
BEGIN
  DBMS_SERVICE.start_service(
    service_name => 'mydb_srv2'
  );
END;
/
exit;

