FROM alpine:3.16

RUN apk update && apk add --no-cache mariadb mariadb-common mariadb-client openrc

RUN openrc
RUN touch /run/openrc/softlevel

COPY requirements/mariadb/tools/schema.sh .
COPY requirements/mariadb/conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod +x /schema.sh

VOLUME [ "/sys/fs/cgroup" ]

EXPOSE 3306

ENTRYPOINT ["./schema.sh"]
