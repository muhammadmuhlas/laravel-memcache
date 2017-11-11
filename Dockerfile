FROM php:5.6.32

WORKDIR /var/www/web

RUN apt-get update

RUN apt-get install -y libpq-dev unzip mcrypt libmcrypt-dev libicu-dev g++ libpng-dev musl-dev libxslt-dev libffi-dev \
    && docker-php-ext-install pdo pdo_mysql mcrypt gd exif intl xsl json soap dom zip opcache

RUN apt-get install -y libmemcached-dev zlib1g-dev \
    && pecl install memcached-2.2.0 \
    && docker-php-ext-enable memcached