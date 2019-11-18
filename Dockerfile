FROM alpine:latest

RUN apk update && apk upgrade \
  && apk add apache2 php \
  && mkdir -p /usr/src/app

WORKDIR /usr/src/app

VOLUME /usr/src/app

CMD ["rc-service apache2 start"]