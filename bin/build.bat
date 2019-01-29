@ECHO OFF

SET CURRENT_DIR=%cd%
pushd %~dp0..
SET APP_DIR=%cd%
popd

cd %APP_DIR% && docker-compose build
cd %CURRENT_DIR%
