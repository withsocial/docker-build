# Dockerfile for WithSocial.com builds and any other PHP/Composer based project

FROM php:7.1
MAINTAINER Ben Sampson <ben@myns.co>


RUN apt-get update -yqq && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    git \
    zip \
    unzip \
    sudo \
    rubygems

RUN docker-php-ext-install \
    mbstring \
    pdo_mysql \
    pdo_pgsql \
    sqlite3 \
    curl \
    json \
    intl \
    gd \
    xml \
    zip \
    bz2 \
    opcache \
    bcmath
    
RUN pecl install imagick && \
    docker-php-ext-enable \
    imagick

RUN php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

# Is this good?
RUN php -v && \
    git --version && \
    composer --version
