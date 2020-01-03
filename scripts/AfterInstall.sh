sudo chown -R www-data:www-data /home/ubuntu/app

cd /home/ubuntu/app

composer install

sudo chgrp -R www-data storage bootstrap/cache
sudo chmod -R ug+rwx storage bootstrap/cache


echo DB_HOST=$DATABASE_URL >>.env
echo DB_USERNAME=$DATABASE_USERNAME >>.env
echo DB_PASSWORD=$DATABASE_PASSWORD >>.env
echo DB_DATABASE=$DATABASE_NAME >>.env


echo 'DB_PORT=3306' >>.env

echo 'DB_CONNECTION=mysql' >>.env




echo 'APP_NAME=Laravel'>>.env
echo 'APP_ENV=local'>>.env

echo 'APP_DEBUG=false'>>.env
echo 'APP_URL=http://localhost'>>.env

echo 'LOG_CHANNEL=stack'>>.env



echo 'BROADCAST_DRIVER=log'>>.env
echo 'CACHE_DRIVER=file'>>.env
echo 'QUEUE_CONNECTION=sync'>>.env
echo 'SESSION_DRIVER=cookie'>>.env
echo 'SESSION_LIFETIME=120'>>.env

echo 'REDIS_HOST=127.0.0.1'>>.env
echo 'REDIS_PASSWORD=null'>>.env
echo 'REDIS_PORT=6379'>>.env

echo 'MAIL_DRIVER=smtp'>>.env
echo 'MAIL_HOST=smtp.mailtrap.io'>>.env
echo 'MAIL_PORT=2525'>>.env
echo 'MAIL_USERNAME=null'>>.env
echo 'MAIL_PASSWORD=null'>>.env
echo 'MAIL_ENCRYPTION=null'>>.env
echo 'MAIL_FROM_ADDRESS=null'>>.env
echo 'MAIL_FROM_NAME="${APP_NAME}"'>>.env

echo 'AWS_ACCESS_KEY_ID='>>.env
echo 'AWS_SECRET_ACCESS_KEY='>>.env
echo 'AWS_DEFAULT_REGION=us-east-1'>>.env
echo 'AWS_BUCKET='>>.env

echo 'PUSHER_APP_ID='>>.env
echo 'PUSHER_APP_KEY='>>.env
echo 'PUSHER_APP_SECRET='>>.env
echo 'PUSHER_APP_CLUSTER=mt1'>>.env

echo 'MIX_PUSHER_APP_KEY="${PUSHER_APP_KEY}"'>>.env
echo 'MIX_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"'>>.env

composer dump-autoload

php artisan cache:clear

php artisan key:generate

php artisan migrate



