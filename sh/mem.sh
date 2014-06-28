#/bin/bash
	 #script name:GetCheckMem.sh
	mem=`ps -o vsz -p $1|grep -v VSZ`
	 (( mem /= 1000))
         echo $mem
	 if [ $mem -gt 1600 ]
	 then
	 {
	 echo "The usage of memory is larger than 1.6G"
	 }
	 else
	 {
	 echo "The usage of memory is normal"
	 }
	 fi
