FROM php:fpm
WORKDIR "/var/www/html"

RUN apt-get update && apt-get -y --no-install-recommends install \
    git \
    zip \
    libxml2-dev \
    openssl \
    libxslt-dev \
    libzip-dev \
    libpng-dev \
    unzip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install bcmath gd intl pdo_mysql sockets soap xsl zip

RUN docker-php-ext-install opcache

#
#RUN docker-php-ext-install pdo pdo_mysql
#
#RUN pecl install xdebug && docker-php-ext-enable xdebug