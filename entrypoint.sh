#!/bin/sh
APACHE_SERVER_NAME=localhost

rm -f /run/apache2/apache2.pid
rm -f /run/apache2/httpd.pid

sed -i "s/#ServerName www.example.com:80/ServerName $APACHE_SERVER_NAME/" /etc/apache2/httpd.conf
sed -i "s/DocumentRoot \"/var/www/localhost/htdocs\"/DocumentRoot /usr/src/app" /etc/apache2/httpd.conf

httpd -D FOREGROUND