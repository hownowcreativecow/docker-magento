FROM php:7.2-cli-alpine

# Install ssmtp
RUN apk add --no-cache ssmtp

# Install PHP Extension: bc-math
RUN docker-php-ext-install bcmath

# Install PHP Extension: pdo_mysql
RUN docker-php-ext-install pdo_mysql

# Install PHP Extension: opcache
RUN docker-php-ext-install opcache

# Install PHP Extension: intl
RUN apk add --no-cache icu-dev \
    && docker-php-ext-install intl

# Install PHP Extension: xsl
RUN apk add --no-cache libxslt-dev \
    && docker-php-ext-install xsl

# Install PHP Extension: soap
RUN apk add --no-cache libxml2-dev \
    && docker-php-ext-install soap \
    && apk del libxml2-dev

# Install PHP Extension: zip
RUN apk add --no-cache zlib-dev \
    && docker-php-ext-install zip \
    && apk del zlib-dev

# Install PHP Extension: gd
RUN apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev \
  && docker-php-ext-configure gd \
    --with-gd \
    --with-freetype-dir=/usr/include/ \
    --with-png-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install gd \
  && apk del freetype-dev libpng-dev libjpeg-turbo-dev

# Install PHP PECL Extension: redis
RUN apk add --no-cache autoconf g++ make \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apk del autoconf g++ make

# Cleanup
RUN rm -rf /tmp/*

# Copy config files
COPY ./etc/php/mail.ini /usr/local/etc/php/conf.d/zz-mail.ini
COPY ./etc/php/opcache.ini /usr/local/etc/php/conf.d/zz-opcache.ini
COPY ./etc/php/php.ini /usr/local/etc/php/conf.d/zz-php.ini
COPY ./etc/php/php-cli.ini /usr/local/etc/php/conf.d/zz-php-cli.ini

# Fix permissions
RUN mkdir -p /var/www/magento/var/log
RUN adduser root www-data
RUN chown -R :www-data /var/www

# Setup cron tab
COPY ./etc/cron/crontab /var/spool/cron/crontabs/www-data

# Start cron
WORKDIR /var/www/magento
CMD crond -l 2 -f
