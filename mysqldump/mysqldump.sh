#! /bin/bash

TIMESTAMP=$(date +"%F")
BACKUP_DIR="$TIMESTAMP"
MYSQL_USER=""
MYSQL=/usr/bin/mysql
MYSQL_PASSWORD=""
MYSQLDUMP=/usr/bin/mysqldump
MYSQLHOST=''

mkdir -p "/root/mysqldump/$BACKUP_DIR/mysql"

databases=`$MYSQL -h$MYSQLHOST --user=$MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema)"`

for db in $databases; do
  $MYSQLDUMP -h$MYSQLHOST --routines --triggers --add-drop-table --force --user=$MYSQL_USER -p$MYSQL_PASSWORD --databases $db > /root/mysqldump/$BACKUP_DIR/mysql/$db.sql
done
