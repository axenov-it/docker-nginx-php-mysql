
FROM php:7.0-fpm

RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install mysqli

WORKDIR /apps

#ADD ./php.ini $PHP_INI_DIR/php.ini
ADD ./php.ini-development /usr/local/etc/php/php.ini

CMD ["php-fpm"]