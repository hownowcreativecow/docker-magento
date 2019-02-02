#!/bin/sh

cd /var/www/magento

echo "Fixing permissions for development/build environment"
chown -R cli:www-data .
find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
chmod u+x bin/magento
