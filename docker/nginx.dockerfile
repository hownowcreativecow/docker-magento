FROM nginx:stable-alpine

# Copy config files
COPY ./etc/nginx/magento.conf /etc/nginx/magento.conf
COPY ./etc/nginx/default.conf /etc/nginx/conf.d/default.conf

# Setup container
WORKDIR /var/www/magento
