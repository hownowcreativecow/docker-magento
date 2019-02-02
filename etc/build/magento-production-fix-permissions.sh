#!/bin/sh

cd /var/www/magento

echo "Fixing permissions for production environment"
chown -R cli:www-data .
find app/code lib pub/static app/etc generated/code generated/metadata var/view_preprocessed \
    \( -type d -or -type f \) -exec chmod g-w {} + \
    && chmod o-rwx app/etc/env.php
chmod u+x bin/magento
