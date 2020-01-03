cd /home/ubuntu/app

cp /home/ubuntu/.env /home/ubuntu/app

sudo chgrp -R www-data storage bootstrap/cache
sudo chmod -R ug+rwx storage bootstrap/cache

php artisan key:generate

composer install


