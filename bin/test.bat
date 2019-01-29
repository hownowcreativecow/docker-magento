@ECHO OFF

SET CURRENT_DIR=%cd%
pushd %~dp0..
SET APP_DIR=%cd%
popd

cd %APP_DIR%\test && docker-compose down
cd %APP_DIR\bin\build.bat
cd %APP_DIR%\test && docker-compose up -d
cd %CURRENT_DIR%
