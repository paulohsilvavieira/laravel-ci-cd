cd /var/www/html

composer install

npm install


touch .env

echo 'DB_DATABASE=$DATABASE_URL' >> .env
echo 'DB_USERNAME=$DATABASE_USERNAME' >> .env
echo 'DB_PASSWORD=$DATABASE_PASSWORD' >> .env

php artisan key:generate


