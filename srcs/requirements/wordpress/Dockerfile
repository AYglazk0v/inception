FROM alpine:3.16

ARG PHP_VERSION=8
ARG DB_NAME
ARG DB_USER
ARG DB_PASS

RUN apk update && apk upgrade && apk add --no-cache \
		php${PHP_VERSION} \
		php-mysqli \
		mariadb-client \
		php-fpm \
		curl

EXPOSE 9000

ENTRYPOINT []
