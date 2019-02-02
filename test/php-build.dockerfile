FROM creativecow/magento-php-build

# Install magento project
COPY ./auth.json /home/cli/.composer/auth.json
RUN composer create-project --no-ansi --no-dev --no-interaction --no-progress --remove-vcs \
    --repository=https://repo.magento.com/ magento/project-community-edition .
RUN sh /usr/local/bin/magento-development-fix-permissions
