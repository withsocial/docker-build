# Dockerfile for WithSocial.com builds and any other PHP/Composer based project

FROM debian:stretch
MAINTAINER Ben Sampson <ben@myns.co>


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
    php7.2-fpm \
    php7.2-cli \
    php7.2-mbstring \
    php7.2-xml \
    php7.2-zip \
    php7.2-curl \
    php7.2-intl \
    php7.2-gd \
    php7.2-sqlite3 \
    php7.2-mysql \
    php7.2-pgsql \
    rubygems

RUN php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

# Is this good?
RUN php -v && \
    git --version && \
    composer --version
