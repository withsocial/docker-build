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
RUN apt-get install -y php7.0-fpm php7.0-cli php7.0-curl php7.0-intl php7.0-sqlite3 curl git

# Installs Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get upgrade -y

# Test build
RUN php -v
RUN git --version
RUN composer --version
