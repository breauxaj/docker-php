#!/bin/sh

rm -f /run/apache2/apache2.pid
rm -f /run/apache2/httpd.pid

sed -i "s/#ServerName www.example.com:80/ServerName $APACHE_SERVER_NAME/" /etc/apache2/httpd.conf

httpd -D FOREGROUND