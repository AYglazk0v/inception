FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache \
    php \
    php-session \
    php-mysqli \
    wget

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

RUN mv adminer-4.8.1.php index.php

EXPOSE 8080

CMD php -S 0.0.0.0:8080
