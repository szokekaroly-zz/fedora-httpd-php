FROM fedora:latest
LABEL maintainer="szoke.karcsi@gmail.com"
RUN dnf -y update \
 && dnf -y install httpd php php-mysqlnd \
 && dnf clean all
RUN echo "ServerName localhost.local" >> /etc/httpd/conf/httpd.conf
RUN apachectl configtest
COPY info.php /var/www/html/
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
