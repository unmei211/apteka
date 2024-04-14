#!/bin/bash

DB_NAME="apteka"
BACKUP_DIR=/var/lib/pgsql/apteka_backup
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/$DB_NAME-$DATE.sql"

mkdir -p $BACKUP_DIR
# Создаем резервную копию базы данных с использованием pg_dump
#sudo pg_dump -U postgres $DB_NAME > $BACKUP_FILE

PGPASSWORD=cisco pg_dump -U postgres -d $DB_NAME -f $BACKUP_FILE -c
