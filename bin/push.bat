@ECHO OFF

SET CURRENT_DIR=%cd%
pushd %~dp0..
SET APP_DIR=%cd%
popd

docker push creativecow/magento-mysql:latest
docker push creativecow/magento-nginx:latest
docker push creativecow/magento-php-cli:latest
docker push creativecow/magento-php-cron:latest
docker push creativecow/magento-php-fpm:latest
docker push creativecow/magento-redis:latest
docker push creativecow/magento-varnish:latest
