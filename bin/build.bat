@ECHO OFF
setlocal
cd %~dp0.. || exit 1

docker-compose build
