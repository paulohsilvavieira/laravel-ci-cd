sudo chown -R ubuntu:ubuntu /home/ubuntu/app

cd /home/ubuntu/app
rm .env
composer install

sudo chgrp -R ubuntu storage bootstrap/cache
sudo chmod -R ubuntu storage bootstrap/cache

sudo echo 'APP_NAME=Laravel' >>.env
sudo echo 'APP_ENV=local' >>.env
sudo echo 'APP_KEY=' >>.env
sudo echo 'APP_DEBUG=false' >>.env
sudo echo 'APP_URL=http://localhost' >>.env
sudo echo ""  >>.env
sudo echo 'LOG_CHANNEL=stack' >>.env

sudo echo 'DB_CONNECTION=mysql' >>.env
sudo echo "DB_HOST=$DATABASE_URL" >>.env
sudo echo 'DB_PORT=3306' >>.env
sudo echo "DB_DATABASE=$DATABASE_NAME" >>.env
sudo echo "DB_USERNAME=$DATABASE_USERNAME" >>.env
sudo echo "DB_PASSWORD=$DATABASE_PASSWORD" >>.env

sudo echo ""  >>.env


sudo echo 'BROADCAST_DRIVER=log' >>.env
sudo echo 'CACHE_DRIVER=file' >>.env
sudo echo 'QUEUE_CONNECTION=sync' >>.env
sudo echo 'SESSION_DRIVER=cookie' >>.env
sudo echo 'SESSION_LIFETIME=120' >>.env
sudo echo ""  >>.env

sudo echo 'REDIS_HOST=127.0.0.1' >>.env
sudo echo 'REDIS_PASSWORD=null' >>.env
sudo echo 'REDIS_PORT=6379' >>.env
sudo echo ""  >>.env

sudo echo 'MAIL_DRIVER=smtp' >>.env
sudo echo 'MAIL_HOST=smtp.mailtrap.io' >>.env
sudo echo 'MAIL_PORT=2525' >>.env
sudo echo 'MAIL_USERNAME=null' >>.env
sudo echo 'MAIL_PASSWORD=null' >>.env
sudo echo 'MAIL_ENCRYPTION=null' >>.env
sudo echo 'MAIL_FROM_ADDRESS=null' >>.env
sudo echo 'MAIL_FROM_NAME="${APP_NAME}"' >>.env
sudo echo ""  >>.env

sudo echo 'AWS_ACCESS_KEY_ID=' >>.env
sudo echo 'AWS_SECRET_ACCESS_KEY=' >>.env
sudo echo 'AWS_DEFAULT_REGION=us-east-1' >>.env
sudo echo 'AWS_BUCKET=' >>.env
sudo echo ""  >>.env

sudo echo 'PUSHER_APP_ID=' >>.env
sudo echo 'PUSHER_APP_KEY=' >>.env
sudo echo 'PUSHER_APP_SECRET=' >>.env
sudo echo 'PUSHER_APP_CLUSTER=mt1' >>.env
sudo echo ""  >>.env

sudo echo 'MIX_PUSHER_APP_KEY="${PUSHER_APP_KEY}"' >>.env
sudo echo 'MIX_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"' >>.env

composer dump-autoload

php artisan cache:clear

php artisan key:generate

php artisan migrate



