FROM breauxaj/alpine:latest

RUN apk add apache2 \
  ca-certificates \
  curl \
  git \
  nano \
  openntpd \
  openssh \
  openssl \
  php8 \
  php8-apache2 \
  php8-iconv \
  php8-json \
  php8-openssl \
  php8-phar \
  tzdata \
  && apk add php8-bcmath \
  php8-bz2 \
  php8-dom \
  php8-ctype \
  php8-curl \
  php8-dom \
  php8-exif \
  php8-fileinfo \
  php8-ftp \
  php8-gd \
  php8-gettext \
  php8-gmp \
  php8-intl \
  php8-json \
  php8-ldap \
  php8-mbstring \
  php8-mysqlnd \
  php8-odbc \
  php8-opcache \
  php8-pecl-mcrypt \
  php8-pdo \
  php8-pdo_dblib \
  php8-pdo_mysql \
  php8-pdo_odbc \
  php8-pdo_pgsql \
  php8-pdo_sqlite \
  php8-posix \
  php8-redis \
  php8-session \
  php8-simplexml \
  php8-sqlite3 \
  php8-soap \
  php8-tokenizer \
  php8-xdebug \
  php8-xml \
  php8-xmlreader \
  php8-xmlwriter \
  php8-zip \
  && rm -rf /var/cache/apk/* 

RUN curl -sOL https://getcomposer.org/composer.phar \
  && mv composer.phar /usr/local/bin/composer \
  && chmod +x /usr/local/bin/composer

RUN cp /usr/bin/php8 /usr/bin/php \
  && mkdir -p /usr/src/app \
  && chown -R apache:apache /usr/src/app 

COPY entrypoint.sh /entrypoint.sh

WORKDIR /usr/src/app

VOLUME /usr/src/app

CMD ["/entrypoint.sh"]

EXPOSE 80

LABEL org.opencontainers.image.vendor="Breaux Heavy Industries" \
	org.opencontainers.image.url="https://breaux.io" \
	org.opencontainers.image.title="PHP8" \
	org.opencontainers.image.description="Apache httpd with PHP" \
	org.opencontainers.image.version="v0.0.1" \
	org.opencontainers.image.documentation="https://docs.breaux.io"
