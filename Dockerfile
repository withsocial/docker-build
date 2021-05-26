# Dockerfile for WithSocial.com builds and any other PHP/Composer based project

FROM debian:buster
MAINTAINER Ben Sampson


RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    lsb-release \
    ca-certificates \
    curl \
    git \
    zip \
    unzip \
    sudo

ADD https://packages.sury.org/php/apt.gpg /etc/apt/trusted.gpg.d/php.gpg
RUN sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
RUN chmod 664 /etc/apt/trusted.gpg.d/php.gpg

RUN apt-get update && \
    apt-get install -y \
    php8.0-bcmath \
    php8.0-fpm \
    php8.0-cli \
    php8.0-mbstring \
    php8.0-xml \
    php8.0-zip \
    php8.0-curl \
    php8.0-intl \
    php8.0-gd \
    php8.0-sqlite3 \
    php8.0-mysql \
    php8.0-pgsql \
    rubygems

RUN php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

# Install Laravel Envoy
RUN composer global require "laravel/envoy=~1.0"

# Is this good?
RUN php -v && \
    git --version && \
    composer --version
