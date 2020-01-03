sudo chown -R www-data:www-data /home/ubuntu/app

sudo find /home/ubuntu/app/ -type d -exec chmod 755 {} \;
sudo find /home/ubuntu/app/ -type f -exec chmod 644 {} \;

sudo chgrp -R www-data /home/ubuntu/app/storage /home/ubuntu/app/bootstrap/cache
sudo chmod -R ug+rwx /home/ubuntu/app/storage /home/ubuntu/app/bootstrap/cache

sudo usermod -a -G www-data ubuntu

sudo chown -R ubuntu:www-data /home/ubuntu/app


sudo find /home/ubuntu/app/ -type f -exec chmod 664 {} \;
sudo find /home/ubuntu/app/ -type d -exec chmod 775 {} \;

cd /home/ubuntu/app


rm /home/ubuntu/.env

composer install

echo 'APP_NAME=Laravel' >>/home/ubuntu/.env
echo 'APP_ENV=local' >>/home/ubuntu/.env
echo 'APP_KEY=' >>/home/ubuntu/.env
echo 'APP_DEBUG=false' >>/home/ubuntu/.env
echo 'APP_URL=http://localhost' >>/home/ubuntu/.env
echo ""  >>/home/ubuntu/.env
echo 'LOG_CHANNEL=stack' >>/home/ubuntu/.env

echo ""  >>/home/ubuntu/.env

echo 'BROADCAST_DRIVER=log' >/home/ubuntu/.env
echo 'CACHE_DRIVER=file' >>/home/ubuntu/.env
echo 'QUEUE_CONNECTION=sync' >>/home/ubuntu/.env
echo 'SESSION_DRIVER=cookie' >>/home/ubuntu/.env
echo 'SESSION_LIFETIME=120' >>/home/ubuntu/.env
echo ""  >>/home/ubuntu/.env

echo 'REDIS_HOST=127.0.0.1' >>/home/ubuntu/.env
echo 'REDIS_PASSWORD=null' >>/home/ubuntu/.env
echo 'REDIS_PORT=6379' >>/home/ubuntu/.env
echo ""  >>/home/ubuntu/.env

echo 'MAIL_DRIVER=smtp' >>/home/ubuntu/.env
echo 'MAIL_HOST=smtp.mailtrap.io' >>/home/ubuntu/.env
echo 'MAIL_PORT=2525' >>/home/ubuntu/.env
echo 'MAIL_USERNAME=null' >>/home/ubuntu/.env
echo 'MAIL_PASSWORD=null' >>/home/ubuntu/.env
echo 'MAIL_ENCRYPTION=null' >>/home/ubuntu/.env
echo 'MAIL_FROM_ADDRESS=null' >>/home/ubuntu/.env
echo 'MAIL_FROM_NAME="${APP_NAME}"' >>/home/ubuntu/.env
echo ""  >>/home/ubuntu/.env

echo 'AWS_ACCESS_KEY_ID=' >>/home/ubuntu/.env
echo 'AWS_SECRET_ACCESS_KEY=' >>/home/ubuntu/.env
echo 'AWS_DEFAULT_REGION=us-east-1' >>/home/ubuntu/.env
echo 'AWS_BUCKET=' >>/home/ubuntu/.env
echo ""  >>/home/ubuntu/.env

echo 'PUSHER_APP_ID=' >>/home/ubuntu/.env
echo 'PUSHER_APP_KEY=' >>/home/ubuntu/.env
echo 'PUSHER_APP_SECRET=' >>/home/ubuntu/.env
echo 'PUSHER_APP_CLUSTER=mt1' >>/home/ubuntu/.env
echo ""  >>/home/ubuntu/.env

echo 'MIX_PUSHER_APP_KEY="${PUSHER_APP_KEY}"' >>/home/ubuntu/.env
echo 'MIX_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"' >>/home/ubuntu/.env

echo ""  >>/home/ubuntu/.env

echo 'DB_CONNECTION=mysql' >>/home/ubuntu/.env
echo "DB_HOST=$DATABASE_URL" >>/home/ubuntu/.env
echo 'DB_PORT=3306' >>/home/ubuntu/.env
echo "DB_DATABASE=$DATABASE_NAME" >>/home/ubuntu/.env
echo "DB_USERNAME=$DATABASE_USERNAME" >>/home/ubuntu/.env
echo "DB_PASSWORD=$DATABASE_PASSWORD" >>/home/ubuntu/.env

mv /home/ubuntu/.env .env

composer dump-autoload

php artisan cache:clear

php artisan key:generate

php artisan migrate





