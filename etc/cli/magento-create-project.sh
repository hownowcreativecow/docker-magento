#!/bin/sh

echo "Create project in temporary folder"
cd /var/www
composer create-project --repository=https://repo.magento.com/ magento/project-community-edition magento.tmp

echo "Moving project to destination"
mv -f magento.tmp/* magento
magento-fix-permissions
