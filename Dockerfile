FROM fedora:latest
RUN dnf install -y httpd php php-mysqlnd php-xdebug
RUN echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf
RUN echo "xdebug.remote_enable=1" >> /etc/php.d/15-xdebug.ini \
    && echo "xdebug.remote_autostart=1" >> /etc/php.d/15-xdebug.ini \
    && echo "xdebug.idekey=netbeans-xdebug" >> /etc/php.d/15-xdebug.ini
RUN apachectl configtest
COPY info.php /var/www/html/
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
