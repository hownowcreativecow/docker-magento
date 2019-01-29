FROM nginx:stable-alpine

# Copy config files
COPY ./etc/nginx/magento.conf /etc/nginx/magento.conf
COPY ./etc/nginx/default.conf /etc/nginx/conf.d/default.conf

# Fix permissions
RUN set -x ; \
    addgroup -g 82 -S www-data ; \
    adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1
RUN sed -i s/'user  nginx;'/'user www-data www-data;'/g /etc/nginx/nginx.conf
RUN mkdir -p /var/www/magento
RUN adduser root www-data
RUN chown -R :www-data /var/www

# Setup container
WORKDIR /var/www/magento
