# fedora-httpd-php
Dockerfile for web development

This image was made for developing web application in php language.

What does it contain?
This image built on Fedora 24. It contains a httpd web server with php and php-mysql and xdebug.
You can access web server on port 80.

How can you use it?

1. docker run -p 80:80 --name web szokekaroly/fedora-http-php
2. docker cp src web:/var/www/html
3. in the browser: http://localhost/src

How can you link this image with mariadb?
  You need an initialized and configured mariadb docker image.

1. docker run -p 3306:3306 --name mariadb mariadb
2. docker run -p 80:80 --name --link mariadb:db web szokekaroly/fedora-http-php
3. set in php configuration file: hostname:db, password:yourpw

  Or you can make a docker-composer file.

Using image with xdebug
  docker run -p 80:80 -e XDEBUG_CONFIG="remote_host={{YOUR_IP_ADDRESS}}" fedora-httpd-php
