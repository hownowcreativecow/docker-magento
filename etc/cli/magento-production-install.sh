#!/bin/sh

cd /var/www/magento

echo "Beginning Magento install into production environment"

magento-install

echo "Set environment in production mode"
bin/magento deploy:mode:set production

echo "Clean cache"
bin/magento cache:flush

magento-compile-assets
magento-production-fix-permissions

echo "Reindex"
bin/magento indexer:reindex
