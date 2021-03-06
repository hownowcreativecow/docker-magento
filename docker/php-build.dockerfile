FROM creativecow/magento-php-cli

# Use root user for container build
USER root

# Copy composer
COPY --from=composer /usr/bin/composer /usr/local/bin/composer
RUN mkdir -p /home/cli/.composer \
    && chown -R cli:www-data /home/cli


# Copy installation files
COPY ./etc/build/magento-compile-assets.sh /usr/local/bin/magento-compile-assets
COPY ./etc/build/magento-composer-install.sh /usr/local/bin/magento-composer-install
COPY ./etc/build/magento-development-fix-permissions.sh /usr/local/bin/magento-development-fix-permissions
COPY ./etc/build/magento-development-install.sh /usr/local/bin/magento-development-install
COPY ./etc/build/magento-install.sh /usr/local/bin/magento-install
COPY ./etc/build/magento-production-fix-permissions.sh /usr/local/bin/magento-production-fix-permissions
COPY ./etc/build/magento-production-install.sh /usr/local/bin/magento-production-install
COPY ./etc/build/magento-production-upgrade.sh /usr/local/bin/magento-production-upgrade

# Set user back to cli
USER cli:www-data
