#!/bin/sh

echo "Compiling assets"
bin/magento setup:di:compile
bin/magento setup:static-content:deploy -f -s compact
