#!/bin/bash
for i in $(seq -w 10)
do
pass=$(echo "$RANDOM"|md5sum|cut -c 1-8 )
#useradd oldboy$i
echo "$pass" |passwd --stdin oldboy$i
echo -e "user oldboy$i:\t passwd:" $pass
done
