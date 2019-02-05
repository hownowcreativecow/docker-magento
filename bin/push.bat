@ECHO OFF
setlocal
cd %~dp0.. || exit 1

docker push creativecow/magento-elasticsearch:latest
docker push creativecow/magento-mysql:latest
docker push creativecow/magento-nginx:latest
docker push creativecow/magento-php-build:latest
docker push creativecow/magento-php-cli:latest
docker push creativecow/magento-php-cron:latest
docker push creativecow/magento-php-fpm:latest
docker push creativecow/magento-redis:latest
docker push creativecow/magento-varnish:latest
