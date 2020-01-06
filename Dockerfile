# Dockerfile for CI builds and any other PHP/Composer based project

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
    php7.4-bcmath \
    php7.4-fpm \
    php7.4-cli \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-zip \
    php7.4-curl \
    php7.4-intl \
    php7.4-gd \
    php7.4-sqlite3 \
    php7.4-mysql \
    php7.4-pgsql \
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
