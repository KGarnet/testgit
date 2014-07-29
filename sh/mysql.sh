#!/bin/bash
USER=root
PASS=redhat
MYSQL="mysql -u$USER -p$PASS"
MYDUMP="mysqldump -u$USER -p$PASS"
for db in cacti
do
$MYDUMP $db|gzip> /tmp/${db}_$(date +%F).gz
done
