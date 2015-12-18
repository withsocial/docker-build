# Dockerfile for WithSocial builds
FROM debian:jessie
MAINTAINER Ben Sampson <ben@myns.co>

# Install dotdeb for up-to-date packages
ADD https://www.dotdeb.org/dotdeb.gpg /tmp/dotdeb.gpg

RUN echo "Install dotdeb" \
	&& echo "deb http://packages.dotdeb.org jessie all" > /etc/apt/sources.list.d/dotdeb.list \
	&& echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list.d/dotdeb.list \
	&& apt-key add /tmp/dotdeb.gpg

RUN apt-get update -y

# Installs PHP/mods and software.
RUN apt-get install -y php7.0-fpm php7.0 php7.0-curl php7.0-intl php7.0-sqlite3 curl git

# Installs Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Pull in preset php.ini file
RUN curl -sS https://d.pr/n/lzCa/php56.ini -o /etc/php5/cli/php.ini

RUN apt-get upgrade -y

# Test build
RUN php -v
RUN git --version
RUN composer --version
