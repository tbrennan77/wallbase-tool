#!/bin/bash
LATEST_BACKUP=$(ls -1 db/backups | tail -n 1);
NUMBER_OF_BACKUPS=$(ls -1 db/backups | wc -l);
dropdb product_chart;
createdb product_chart;
pg_restore -d product_chart db/backups/$LATEST_BACKUP;
clear;
echo -e "\033[1;33m\n\n   ********************************************************************\n   *                                                                  *\n   *    \033[1;37mDatabase was restored with:\033[1;31m db/backups/$LATEST_BACKUP\033[0m    \033[1;33m*\n   *                                                                  *\n   ********************************************************************\n\n"

if [ "$NUMBER_OF_BACKUPS" -gt "5" ]
then
  OLDEST_BACKUP=$(ls -1 db/backups | head -1);
  rm db/backups/$OLDEST_BACKUP;
fi

#if [ -z "$String" ]
#then
#  echo "\$String is null."
#else
#  echo "\$String is NOT null."
#fi  