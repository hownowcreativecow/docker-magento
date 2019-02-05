@ECHO OFF
setlocal
cd %~dp0..\test || exit 1

ECHO "Stopping test application"
CALL docker-compose down

ECHO "Rebuilding base images"
CALL ..\bin\build.bat

ECHO "Rebuilding test images"
CALL docker-compose build --no-cache

ECHO "Starting test application"
docker-compose up -d

ECHO "Waiting for test application to be ready..."
CALL TIMEOUT /T 5 /NOBREAK

ECHO "Installing magento"
CALL docker-compose exec php-build magento-development-install
