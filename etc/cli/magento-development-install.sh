#!/bin/sh

cd /var/www/magento

echo "Beginning Magento install into development environment"

magento-install

echo "Set environment in developer mode"
bin/magento deploy:mode:set developer

echo "Clean cache"
bin/magento cache:flush

magento-compile-assets
magento-development-fix-permissions

echo "Reindex"
bin/magento indexer:reindex
