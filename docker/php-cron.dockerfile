FROM creativecow/magento-php-cli

# Ensure directory is present
RUN mkdir -p /var/www/magento/var/log
RUN chown -R :www-data /var/www

# Setup cron tab
RUN printf "\
* * * * * /usr/local/bin/php /var/www/magento/bin/magento cron:run | grep -v Ran jobs by schedule >> /var/www/magento/var/log/magento.cron.log\n\
* * * * * /usr/local/bin/php /var/www/magento/update/cron.php >> /var/www/magento/var/log/update.cron.log\n\
* * * * * /usr/local/bin/php /var/www/magento/bin/magento setup:cron:run >> /var/www/magento/var/log/setup.cron.log\n\
" > /var/spool/cron/crontabs/www-data

# Setup container
WORKDIR /var/www/magento
CMD crond -l 2 -f
