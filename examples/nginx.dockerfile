FROM creativecow/magento-nginx

# Copy application
COPY --from=creativecow/magento-php-build-test --chown=cli:www-data /var/www/magento/pub /var/www/magento/pub
