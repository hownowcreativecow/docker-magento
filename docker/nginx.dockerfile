FROM nginx:stable-alpine

# Copy config files
COPY ./etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./etc/nginx/mime.types /etc/nginx/mime.types
COPY ./etc/nginx/magento.conf /etc/nginx/magento.conf
COPY ./etc/nginx/sites-available/000-default.conf /etc/nginx/sites-available/000-default.conf

# Setup container
WORKDIR /var/www/magento
