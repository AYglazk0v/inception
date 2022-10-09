FROM alpine:3.16

RUN apk add prometheus

COPY ./requirements/bonus/prometheus/conf/prometheus.yml /etc/prometheus/prometheus.yml

WORKDIR /etc/prometheus/

EXPOSE 9090

CMD prometheus --config.file=prometheus.yml --web.listen-address=:9090
