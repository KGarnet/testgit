#!/bin/bash
for i in {1..254}
do
(ping 10.66.218.$i -c 2 >/dev/null 2>&1
if [ $? -eq 0 ]
then echo " ip $i is alive"
fi)&
done
wait


