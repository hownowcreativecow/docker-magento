#!/bin/sh

cd /var/www/magento

echo "Beginning production upgrade..."

echo "Entering maintenance mode"
bin/magento maintenance:enable

echo "Importing config"
bin/magento app:config:import

echo "Upgrade magento database"
bin/magento setup:upgrade --keep-generated

echo "Cleaning cache"
bin/magento cache:clean

echo "Leaving maintenance mode"
bin/magento maintenance:disable

echo "...production upgrade finished"
