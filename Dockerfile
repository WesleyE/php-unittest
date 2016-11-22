FROM php:latest
MAINTAINER Wesley Elfring <wesley@combustible.nl>

# Update packages and install Git and Zip (needed for Composer to run)
RUN apt-get update -yqq
RUN apt-get install git unzip -yqq

# Install MySQL and Xdebug (needed for phpunit code coverage)
RUN docker-php-ext-install pdo_mysql
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php

# Cleanup
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
