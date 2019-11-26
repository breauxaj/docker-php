FROM breauxaj/alpine:latest

RUN apk add apache2 \
  ca-certificates \
  curl \
  git \
  nano \
  openntpd \
  openssh \
  openssl \
  php7 \
  php7-apache2 \
  php7-iconv \
  php7-json \
  php7-openssl \
  php7-phar \
  tzdata  

RUN curl -sOL https://getcomposer.org/composer.phar \
  && mv composer.phar /usr/local/bin/composer \
  && chmod +x /usr/local/bin/composer

RUN apk add php7-bcmath \
  php7-bz2 \
  php7-dom \
  php7-ctype \
  php7-curl \
  php7-dom \
  php7-exif \
  php7-fileinfo \
  php7-ftp \
  php7-gd \
  php7-gettext \
  php7-gmp \
  php7-intl \
  php7-json \
  php7-ldap \
  php7-mbstring \
  php7-mcrypt \
  php7-mysqlnd \
  php7-odbc \
  php7-opcache \
  php7-pdo \
  php7-pdo_dblib \
  php7-pdo_mysql \
  php7-pdo_odbc \
  php7-pdo_pgsql \
  php7-pdo_sqlite \
  php7-posix \
  php7-redis \
  php7-session \
  php7-simplexml \
  php7-sqlite3 \
  php7-soap \
  php7-tokenizer \
  php7-xdebug \
  php7-xml \
  php7-xmlreader \
  php7-xmlrpc \
  php7-xmlwriter \
  php7-zip

RUN apk add php7-simplexml

RUN cp /usr/bin/php7 /usr/bin/php \
  && rm -rf /var/cache/apk/* \
  && mkdir -p /usr/src/app \
  && chown -R apache:apache /usr/src/app 

COPY entrypoint.sh /entrypoint.sh

WORKDIR /usr/src/app

VOLUME /usr/src/app

CMD ["/entrypoint.sh"]

EXPOSE 80