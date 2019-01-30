#!/bin/sh

echo "Fixing permissions"
cd /var/www/magento
chown -R :www-data .
find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
chmod u+x bin/magento
