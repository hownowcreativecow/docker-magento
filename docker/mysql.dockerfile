FROM mariadb:10.2

# Setup environment
ENV MYSQL_RANDOM_ROOT_PASSWORD=yes
ENV MYSQL_DATABASE=magento
ENV MYSQL_USER=magento_user
ENV MYSQL_PASSWORD=magento_pass
ENV MYSQL_ALLOW_EMPTY_PASSWORD=no

# Copy config files
COPY ./etc/mariadb/utf8mb4.cnf /etc/mysql/conf.d/utf8mb4.cnf
