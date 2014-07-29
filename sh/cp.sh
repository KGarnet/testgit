#!/bin/bash
NAME='/etc/ovirt-engine/ /etc/sysconfig/ovirt-engine/ /etc/yum/pluginconf.d/versionlock.list 
/etc/pki/ovirt-engine/  /usr/share/jasperreports-server-pro/buildomatic /var/lib/ovirt-engine/backups /var/lib/ovirt-engine/deployments 
/usr/share/ovirt-engine-reports/reports/users/rhevm-002dadmin.xml /usr/share/ovirt-engine-reports/default_master.properties /root/.rnd'

#NAME='/home/jiazhan/test1/ /home/jiazhan/txt'

TMP='/tmp'
for i in $NAME
do
if [ -d $i ]
then
#	echo $i
	newdir="${TMP}$i"
	mkdir -p $newdir
	cp -av "$i"* $newdir
elif [ -f $i ]
  then
	DIR="$(dirname $i)"
	DIR2="/tmp$DIR"
	mkdir -p $DIR2
	cp -av $i $DIR2
fi
	
done
