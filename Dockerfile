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
    php8.1-bcmath \
    php8.1-fpm \
    php8.1-cli \
    php8.1-mbstring \
    php8.1-xml \
    php8.1-zip \
    php8.1-curl \
    php8.1-intl \
    php8.1-gd \
    php8.1-sqlite3 \
    php8.1-mysql \
    php8.1-pgsql \
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
