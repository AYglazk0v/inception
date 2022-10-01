FROM alpine:3.16

ARG DB_NAME
ARG DB_USER
ARG DB_PASS

RUN echo "Asdasdasd $DB_NAME #DB_USER $DB_PASS"

RUN apk update && apk add --no-cache mariadb mariadb-common mariadb-client openrc

RUN openrc
RUN touch /run/openrc/softlevel

COPY requirements/mariadb/tools/schema.sh .
RUN chmod +x /schema.sh

EXPOSE 3306

ENTRYPOINT ["./schema.sh"]
