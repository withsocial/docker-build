# Dockerfile for WithSocial.com builds and any other PHP/Composer based project

FROM debian:jessie
MAINTAINER Ben Sampson <ben@myns.co>

# Install some base packages
RUN apt-get update -y
RUN apt-get install -y apt-transport-https ca-certificates curl git zip unzip

# Download and save apt PGP for php
ADD https://packages.sury.org/php/apt.gpg /etc/apt/trusted.gpg.d/php.gpg

# Add php apt source
RUN echo "deb https://packages.sury.org/php/ jessie main" > /etc/apt/sources.list.d/php.list

# Update local package list
RUN apt-get update -y

# Installs php/mods and software.
RUN apt-get install -y php7.1-fpm php7.1-cli php7.1-mbstring php7.1-xml php7.1-curl php7.1-intl php7.1-gd php7.1-sqlite3 rubygems sudo

# Install Composer
RUN php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"

# Upgrade any packages
RUN apt-get upgrade -y

# Test build
RUN php -v
RUN git --version
RUN composer --version
