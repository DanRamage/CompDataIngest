#!/bin/bash

source /usr/local/virtualenv/pyenv-3.8.5/bin/activate

if [ ! -f /tmp/lock_populate_xenia_comp ]; then
  touch /tmp/lock_populate_xenia_comp

  startTime=`date -u`
  echo "Start time: $startTime\n" > /home/xeniaprod/tmp/log/populate_xenia_comp.log 2>&1

  cd /home/xeniaprod/scripts/CompDataIngest

  python /home/xeniaprod/scripts/CompDataIngest/COMPDataIngestion.py --ConfigFile=/home/xeniaprod/config/comp_ingest.ini >> /home/xeniaprod/tmp/log/populate_xenia_comp.log 2>&1
  rm -f /tmp/lock_populate_xenia_comp

  startTime=`date -u`
  echo "\nEnd time: $startTime" >> /home/xeniaprod/tmp/log/populate_xenia_comp.log 2>&1

else
  startTime=`date -u`
  echo "Lock file exists, cannot run script: $startTime\n" >> /home/xeniaprod/tmp/log/populate_xenia_comp.log 2>&1
fi