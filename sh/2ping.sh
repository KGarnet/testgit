#!/bin/bash
file="/tmp/$0_$$"
read -p "input the subnet: (default '10.66.218' if press enter to accept):" sub
if [ x"$sub" == x ]
then
	sub='10.66.218'
fi
for i in $(seq 254)
#for i in {1..254}
do
(ping $sub.$i -c 2 >/dev/null 2>&1
if [ $? -eq 0 ]
then echo " ip $sub.$i is alive">>$file
fi)&
done
wait
cat $file |sort -t.  -nk4
