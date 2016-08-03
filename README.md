# fedora-httpd-php docker image
## Dockerfile for web development

This image was made for developing web application in php language.

### What does it contain?
This image built on Fedora 24. It contains a httpd web server with php and php-mysql and xdebug.
You can access web server on port 80.

### How can you use it?

1. `docker run -p 80:80 --name web szokekaroly/fedora-http-php`
2. `docker cp src web:/var/www/html`
3. you can access in the browser: http://localhost/src

### How can you link this image with mariadb?
You need an initialized and configured mariadb docker image.

1. `docker run -p 3306:3306 --name mariadb -e MYSQL_ROOT_PASSWORD=yourpw mariadb`
2. `docker run -p 80:80 --name web --link mariadb:db szokekaroly/fedora-httpd-php`
3. set in php configuration file: hostname:db, password:yourpw

Or you can make a docker-composer file. (I will try it later.)

### Using image with xdebug
`docker run -p 80:80 -e XDEBUG_CONFIG="remote_host={{YOUR_IP_ADDRESS}}" szokekaroly/fedora-httpd-php:xdebug`

example: `docker run -p 80:80 -e XDEBUG_CONFIG="remote_host=192.168.0.2" szokekaroly/fedora-httpd-php:xdebug`
