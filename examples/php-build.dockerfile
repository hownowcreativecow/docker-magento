FROM creativecow/magento-php-build

################################################################################
#                                                                              #
# Build your application here...                                               #
#                                                                              #
#                                                                              #
# This example expects a repository with the following in the same directory   #
# as these files.                                                              #
#         - auth.json         - Composer authentication file                   #
#         - src               - Magento root installation                      #
#             - .dockerignore - The project files to exclude from the image    #
#                                                                              #
# The current working directory is "/var/www/magento"                          #
# The current user:group is "cli:www-data  "                                   #
#                                                                              #
################################################################################

# Setup composer auth.json so composer can connect to Magento Marketplace
COPY --chown=cli:www-data ./auth.json /home/cli/.composer/auth.json

# Copy your application files
COPY --chown=cli:www-data ./src .

# Build magento
RUN sh /usr/local/bin/magento-composer-install
RUN sh /usr/local/bin/magento-compile-assets
RUN sh /usr/local/bin/magento-production-fix-permissions
