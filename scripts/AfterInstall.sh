cd /home/ubuntu/app

# create .env in server

cp /home/ubuntu/.env /home/ubuntu/app

sudo chgrp -R www-data storage bootstrap/cache
sudo chmod -R ug+rwx storage bootstrap/cache

composer install

php artisan key:generate

php artisan migrate

