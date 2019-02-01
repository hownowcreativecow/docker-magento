FROM creativecow/magento-php-fpm

# Copy application
COPY --from=creativecow/magento-php-build-test --chown=cli:www-data /var/www/magento /var/www/magento
