FROM nginx:stable-alpine

# Copy config files
COPY ./etc/nginx/magento.conf /etc/nginx/magento.conf
COPY ./etc/nginx/default.conf /etc/nginx/conf.d/default.conf

# Create www-data user for use by nginx
RUN addgroup -g 82 -S www-data\
    && adduser -u 82 -D -S -G www-data www-data
RUN sed -i s/'user  nginx;'/'user www-data www-data;'/g /etc/nginx/nginx.conf

# Create cli user
RUN adduser -u 1000 -D -G www-data cli

# Fix permissions
RUN mkdir -p /var/www/magento
RUN chown -R cli:www-data /var/www

# Setup container
WORKDIR /var/www/magento
