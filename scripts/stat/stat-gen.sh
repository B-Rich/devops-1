#!/bin/bash
stat=`cat searchd.log | grep 'JSON' | wc -l`
day=`date +%F`
echo "${day} ${stat}" | tee  -a stat.log
