FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    nginx \
    libpng-dev \
    libjpeg-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql

WORKDIR /var/www/html

COPY . .

EXPOSE 80

CMD ["php-fpm"]

