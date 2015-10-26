# Dockerfile for WithSocial builds
FROM debian:jessie
MAINTAINER Ben Sampson <ben@myns.co>

RUN apt-get update -y

# Installs PHP 5.6 with extensions
RUN apt-get install -y php5-cli php5-curl php5-intl php5-memcached php5-sqlite curl git memcached

# Installs Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Pull in preset php.ini file
RUN curl -sS https://d.pr/n/lzCa/php56.ini -o /etc/php5/cli/php.ini

RUN apt-get upgrade -y

# Test build
RUN php -v
RUN git --version
RUN composer --version
