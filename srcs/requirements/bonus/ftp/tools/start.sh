#!/bin/sh

adduser $DB_USER << EOF
$DB_PASS
$DB_PASS
EOF

mkdir -p /home/$DB_USER/ftp

mkdir -p /home/$DB_USER/ftp/files

chown $DB_USER:$DB_USER /home/$DB_USER/ftp/files/

echo $DB_USER | tee -a /etc/vsftpd.userlist

cd /home/$DB_USER/ftp/files

vsftpd /etc/vsftpd.conf
