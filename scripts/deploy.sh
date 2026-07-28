#!/bin/bash
cd /var/www/assesmentrepo

# Set storage and cache permissions
chown -R ubuntu:www-data /var/www/assesmentrepo
chmod -R 775 storage bootstrap/cache public

# Run Laravel migrations and clear caches
php artisan migrate --force
php artisan config:clear
php artisan route:clear
php artisan view:clear
php artisan cache:clear

# Restart PHP-FPM and Nginx
systemctl restart php8.5-fpm
systemctl restart nginx
