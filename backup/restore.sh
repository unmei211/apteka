#!/bin/bash

BACKUP_DIR=/var/lib/pgsql/apteka_backup

LATEST_BACKUP="/$(ls -t $BACKUP_DIR | head -n 1)"

echo "Последняя резервная копия: $LATEST_BACKUP"

BACKUP_FILE=$BACKUP_DIR$LATEST_BACKUP

DB_NAME=apteka
USERNAME=postgres

# Восстанавливаем базу данных из резервной копии
sudo psql -U $USERNAME -d $DB_NAME < $BACKUP_FILE



