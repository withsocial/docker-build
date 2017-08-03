# Dockerfile for WithSocial.com builds and any other PHP/Composer based project

FROM debian:stretch
MAINTAINER Ben Sampson <ben@myns.co>


RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    git \
    zip \
    unzip \
    sudo

ADD https://packages.sury.org/php/apt.gpg /etc/apt/trusted.gpg.d/php.gpg
RUN echo "deb https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list

RUN apt-key update && \
    apt-get update && \
    apt-get install -y \
    php7.1-fpm \
    php7.1-cli \
    php7.1-mbstring \
    php7.1-xml \
    php7.1-zip \
    php7.1-curl \
    php7.1-intl \
    php7.1-gd \
    php7.1-sqlite3 \
    php7.1-mysql \
    php7.1-pgsql \
    rubygems

RUN php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

# Is this good?
RUN php -v && \
    git --version && \
    composer --version
