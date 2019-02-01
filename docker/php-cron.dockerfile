FROM creativecow/magento-php-cli

# Setup cron tab
COPY ./etc/cron/crontab /var/spool/cron/crontabs/www-data

# Start cron
CMD crond -l 2 -f
