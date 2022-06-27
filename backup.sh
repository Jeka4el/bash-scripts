#!/bin/bash
# Backup  PostgreSQL

DIR="/srv/backups"
TIMENAME=`date +%Y-%m-%d.%H.%M`
PG_DUMPALL="/usr/bin/pg_dumpall"
SUDO="/usr/bin/sudo"
GZIP="/usr/bin/gzip"
BACKUP=$DIR/all-cluster-$TIMENAME.sql.gz

# Удаляем копии старше 10 дня
#find $DIR -name all-cluster* -ctime +21 -delete
find /srv/backups -mtime +10 -type f -delete

# Делаем бекап всего кластера
$SUDO -u postgres $PG_DUMPALL | $GZIP > $BACKUP

# Проверяем успех создание и говорим об этом в журнал
return_code=$?

if [ $return_code -eq 0 ]
then
  logger -t LOGGER 'Postgres backup - OK'
else
  logger -t LOGGER 'Postgres backup - ERROR'
fi


