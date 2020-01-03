cd /var/www/html

composer install

touch .env

echo DB_DATABASE=$DATABASE_URL >> .env
echo DB_USERNAME=$DATABASE_USERNAME >> .env
echo DB_PASSWORD=$DATABASE_PASSWORD >> .env

composer dump-autoload

php artisan key:generate



