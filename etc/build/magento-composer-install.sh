#!/bin/sh

echo "Installing dependencies"
composer install --no-ansi --no-dev --no-interaction --no-progress --no-suggest --optimize-autoloader
