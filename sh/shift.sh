#!/bin/bash  
usage()  
{  
  echo "usage:`basename $0` -[l|u] file [files]" >&2  
  exit 1   
}     
if [ $# -eq 1 ]; then  
    usage  
fi  
opt=""  
while [ $# -ne 1 ]   
do  
   opt=$1;  
   case $opt in   
      -l|-L) echo "-l or -L options is specified"  
             shift  
             ;;  
      -u|-U) echo "-u or -U options is specified"  
              shift  
             ;;  
      *)  usage  
             ;;  
   esac  
done  
