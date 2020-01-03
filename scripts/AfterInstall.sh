cd /home/ubuntu/app

composer install

touch .env

echo DB_HOST=$DATABASE_URL >>.env
echo DB_USERNAME=$DATABASE_USERNAME >>.env
echo DB_PASSWORD=$DATABASE_PASSWORD >>.env
echo DB_DATABASE=$DATABASE_NAME >>.env
echo DB_PORT=3306 >>.env
echo DB_CONNECTION=mysql >>.env

composer dump-autoload
php artisan key:generate

php artisan migrate



