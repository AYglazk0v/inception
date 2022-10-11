#!bin/sh
if [ ! -f "/var/www/wp-config.php" ]; then

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;

wp core download --allow-root;

cat << EOF > /var/www/wp-config.php
<?php
define( 'DB_NAME', '${DB_NAME}' );
define( 'DB_USER', '${DB_USER}' );
define( 'DB_PASSWORD', '${DB_PASS}' );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define('FS_METHOD','direct');
\$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
define( 'ABSPATH', __DIR__ . '/' );}
define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', 6379 );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
define( 'WP_REDIS_DATABASE', 0 );
require_once ABSPATH . 'wp-settings.php';
EOF

wp core install --url=${DOMAIN_NAME} --title=Inception --admin_user=${DB_ROOT} --admin_password=${DB_PASS} --admin_email=${DB_ROOT_MAIL} --allow-root
wp user create ${DB_USER} ${DB_USER_MAIL} --allow-root --role=subscriber --user_pass=${DB_PASS}

wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root

wp config set WP_REDIS_HOST "redis"
wp config set WP_REDIS_PORT "6379"
fi

/usr/sbin/php-fpm8 -F
