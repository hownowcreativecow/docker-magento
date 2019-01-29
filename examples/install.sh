#!/bin/sh

# Set folder
cd /var/www/magento

# Install magento
bin/magento setup:install \
    --db-host=mysql \
    --db-name=magento \
    --db-user=magento_user \
    --db-password=magento_pass \
    --admin-firstname=admin \
    --admin-lastname=admin \
    --admin-email="admin@example.com" \
    --admin-user=admin \
    --admin-password=admin123 \
    --language=en_GB \
    --currency=GBP \
    --timezone=Europe/London \
    --use-rewrites=1 \
    --cache-backend=redis \
    --cache-backend-redis-server=redis \
    --cache-backend-redis-db=0 \
    --page-cache=redis \
    --page-cache-redis-server=redis \
    --page-cache-redis-db=1 \
    --session-save=redis \
    --session-save-redis-host=redis \
    --session-save-redis-db=2 \
    --cleanup-database

# Set developer mode
bin/magento deploy:mode:set developer

# Reindex magento
bin/magento indexer:reindex

# Force static content deploy
bin/magento setup:static-content:deploy -f

# Clear cache
bin/magento cache:flush
