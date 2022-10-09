FROM alpine:3.16

RUN apk add vsftpd vim

COPY ./requirements/bonus/ftp/tools/start.sh /var/
COPY ./requirements/bonus/ftp/conf/vsftpd.conf /etc/vsftpd.conf

EXPOSE 2121

CMD sh /var/start.sh
