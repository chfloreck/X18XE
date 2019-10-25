FROM oraclelinux:7-slim
ENV ORACLE_DOCKER_INSTALL=true
# rpm Package für Datenbank
COPY rpm/oracle-database-xe-18c-1.0-1.x86_64.rpm /tmp/.
COPY files/.bash_profile /tmp/
COPY scripts/create_database.sh  /tmp/create_database.sh
COPY scripts/startup.sh /tmp/startup.sh
COPY files/listener.ora /tmp/listener.ora
COPY files/oratab /tmp/oratab
COPY scripts/oraclepw.sh /tmp/oraclepw.sh
COPY scripts/create_services.sh  /tmp/create_services.sh
COPY scripts/start_services.sh  /tmp/start_services.sh
COPY scripts/create_services.sql /tmp/create_services.sql
COPY scripts/start_services.sql /tmp/start_services.sql
COPY scripts/healthcheck.sh /tmp/healthcheck.sh
RUN cd /tmp \
&& yum -y install oracle-database-preinstall-18c \
&& yum -y localinstall  oracle-database-xe-18c-1.0-1.x86_64.rpm  \
&& yum -y install vi file openssl lsof sudo sysstat tree wget which passwd\
&& mv /tmp/.bash_profile /home/oracle/. \
&& mv /tmp/listener.ora /opt/oracle/product/18c/dbhomeXE/network/admin/. \
&& mkdir /home/oracle/scripts \
&& mkdir /home/oracle/logs \
&& chown oracle:oinstall /home/oracle/logs \
&& chown oracle:oinstall /home/oracle/scripts/ \
&& mkdir /home/oracle/bin \
&& chown oracle:oinstall /home/oracle/bin \
&& mkdir -p "/backup/oracle" \
&& chown -R oracle:oinstall "/backup/oracle" \
&& chmod 775 /backup \
&& chmod g+s /backup \
&& cd /tmp \
&& /tmp/oraclepw.sh \
&& rm /tmp/oraclepw.sh \
&& chown oracle:oinstall /tmp/create_database.sh \
&& su - oracle -c "lsnrctl start" \
&& su - oracle -c "/tmp/create_database.sh" \
&& /opt/oracle/product/18c/dbhomeXE/root.sh \
&& mv /tmp/oratab /etc/oratab \
&& mv /tmp/startup.sh /home/oracle/scripts/startup.sh \
&& mv /tmp/create_services.sh /home/oracle/scripts/create_services.sh \
&& mv /tmp/create_services.sql /home/oracle/scripts/create_services.sql \
&& mv /tmp/start_services.sh /home/oracle/scripts/start_services.sh \
&& mv /tmp/start_services.sql /home/oracle/scripts/start_services.sql \
&& mv /tmp/healthcheck.sh /home/oracle/scripts/healthcheck.sh \
&& chmod  u=rwx,g=rx /home/oracle/scripts/*.sh \
&& chown oracle:oinstall /home/oracle/scripts/*.sh \
&& chown oracle:oinstall /home/oracle/scripts/*.sql \
&& chown oracle:oinstall /opt/oracle/product/18c/dbhomeXE/network/admin/*.ora \
&& su - oracle -c "/home/oracle/scripts/create_services.sh"


USER oracle

VOLUME ["/backup"]

EXPOSE 1521 5500

HEALTHCHECK --interval=2m --start-period=5m --timeout=1m CMD  ["/bin/bash","-c","/home/oracle/scripts/healthcheck.sh"] >/dev/null || exit 1

CMD ["/bin/bash","-c","/home/oracle/scripts/startup.sh"]
