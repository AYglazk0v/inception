#!bin/sh

/etc/init.d/mariadb setup
rc-service mariadb start
echo "CREATE DATABASE ${DB_NAME};
ALTER USER 'root'@'localhost' IDENTIFIED BY '';
CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON wordpress.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;" > /tmp/schema.sql
cat /tmp/schema.sql

sed -i "s|skip-networking|skip-networking=0|g" /etc/my.cnf.d/mariadb-server.cnf

mysql -u root < /tmp/schema.sql

rc-service mariadb restart
rc-service mariadb stop

/usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=mysql --pid-file=/run/mysqld/mariadb.pid
