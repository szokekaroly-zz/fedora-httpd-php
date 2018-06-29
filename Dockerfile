FROM fedora:latest
LABEL maintainer="szoke.karcsi@gmail.com"
RUN dnf -y update \
 && dnf -y install httpd php php-mysqlnd php-xdebug \
 && dnf clean all
RUN echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf
RUN echo "xdebug.remote_enable=1" >> /etc/php.d/15-xdebug.ini \
 && echo "xdebug.remote_autostart=1" >> /etc/php.d/15-xdebug.ini \
 && echo "xdebug.idekey=netbeans-xdebug" >> /etc/php.d/15-xdebug.ini
RUN apachectl configtest
COPY info.php /var/www/html/
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
