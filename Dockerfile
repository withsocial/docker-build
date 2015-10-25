# Dockerfile for Laravel - php56 git sqlite composer phpunit
FROM debian/latest
MAINTAINER Ben Sampson <ben@myns.co>

RUN apt-get update -y

# Installs PHP5.6, some extensions and apcu.
RUN apt-get install -y php5 php5-curl php5-intl php5-memcached curl wget git memcached sqlite

# Installs PHPUnit
RUN wget https://phar.phpunit.de/phpunit.phar 
RUN chmod +x phpunit.phar 
RUN mv phpunit.phar /usr/local/bin/phpunit

# Installs Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Pull in preset php.ini file
RUN curl -L https://d.pr/n/lzCa/php56.ini
RUN rm -r /etc/php5/cli/php.ini
RUN cp php56.ini /etc/php5/cli/php.ini 

RUN apt-get upgrade -y

# Test build
RUN php -v
RUN git --version
RUN phpunit --version
RUN composer --version
