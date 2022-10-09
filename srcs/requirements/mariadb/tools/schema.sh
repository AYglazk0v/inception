#!bin/sh

/etc/init.d/mariadb setup
rc-service mariadb start
if [ ! -d "/var/lib/mysql/wordpress" ]; then
echo "CREATE DATABASE ${DB_NAME};
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_PASS}';
CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON wordpress.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;" > /tmp/schema.sql
cat /tmp/schema.sql
mysql -u root -proot < /tmp/schema.sql

fi

sed -i "s|skip-networking|skip-networking=0|g" /etc/my.cnf.d/mariadb-server.cnf

rc-service mariadb restart
rc-service mariadb stop

/usr/bin/mariadbd --datadir=/var/lib/mysql --user=mysql --pid-file=/run/mysqld/mariadb.pid
