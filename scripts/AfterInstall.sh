

sudo chmod -R 777 /home/ubuntu/app

cp /home/ubuntu/.env /home/ubuntu/app

ls -la

php artisan cache:clear

php artisan key:generate

php artisan migrate --force

sudo find /home/ubuntu/app/ -type d -exec chmod 755 {} \;

sudo find /home/ubuntu/app/ -type f -exec chmod 644 {} \;

sudo chgrp -R www-data /home/ubuntu/app/storage /home/ubuntu/app/bootstrap/cache

sudo chmod -R ug+rwx /home/ubuntu/app/storage /home/ubuntu/app/bootstrap/cache

sudo usermod -a -G www-data ubuntu

sudo chown -R ubuntu:www-data /home/ubuntu/app

sudo find /home/ubuntu/app/ -type f -exec chmod 664 {} \;

sudo find /home/ubuntu/app/ -type d -exec chmod 775 {} \;
