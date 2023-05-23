FROM ubuntu:22.04

WORKDIR /var/www/html

ARG SERVER_NAME
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl php8.1-cli php8.1-curl apache2 libapache2-mod-php php-mysql composer cron
RUN a2enmod rewrite expires headers ssl
RUN a2dissite 000-default.conf
RUN rm /var/www/html/index.html

COPY . .

RUN composer install
RUN mkdir -p cache demos sessions /etc/apache2/ssl
RUN chown -R www-data:www-data .

RUN ln -s /etc/apache2/sites-available/${SERVER_NAME}.conf /etc/apache2/sites-enabled/${SERVER_NAME}.conf
RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf

RUN echo '*/1 * * * * www-data php /var/www/html/api/refreshCache.php > /dev/null 2>&1' > /etc/cron.d/board
RUN service cron start

EXPOSE 80 443

CMD ["apachectl", "-D", "FOREGROUND"]
