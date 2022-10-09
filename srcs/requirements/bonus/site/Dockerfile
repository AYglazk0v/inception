FROM alpine:3.16
RUN apk update && apk upgrade && apk add --no-cache nodejs npm

COPY ./requirements/bonus/site/conf/hello.js .

EXPOSE 80

CMD ["node", "hello.js"]
