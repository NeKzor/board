FROM ubuntu:22.04

WORKDIR /var/www/html

ARG SERVER_NAME=board.portal2.local
ARG APT_PACKAGES
ARG DEBIAN_FRONTEND=noninteractive
ARG UID=1000
ARG GID=1000

RUN groupadd www-data
RUN groupmod -g ${GID} www-data
RUN usermod -u ${UID} -g ${GID} www-data

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y ${APT_PACKAGES} curl php8.1-cli php8.1-curl apache2 libapache2-mod-php php-mysql composer cron
RUN a2enmod rewrite expires headers ssl remoteip
RUN a2dissite 000-default.conf
RUN rm /var/www/html/index.html

COPY . .

RUN composer install
RUN mkdir -p cache demos sessions /etc/apache2/ssl
RUN chown -R www-data:www-data .

RUN ln -s /etc/apache2/sites-available/${SERVER_NAME}.conf /etc/apache2/sites-enabled/${SERVER_NAME}.conf
RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf

RUN echo '*/1 * * * * www-data php -f /var/www/html/util/refreshCache.php > /dev/null 2>&1' > /etc/cron.d/board
#RUN echo '0 0 */4 * * www-data php -f /var/www/html/util/fetchImportantProfileData.php > /dev/null 2>&1' >> /etc/cron.d/board

EXPOSE 80 443

CMD service cron start && apachectl -D FOREGROUND
