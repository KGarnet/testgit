#!/bin/bash  
ALL=false  
HELP=false  
FILE=false  
VERBOSE=false  
CHAR=false  
while getopts :ahfgc: OPTION  
do  
    case $OPTION in   
    a)   ALL=true  
         echo "ALL is $ALL"  
         ;;  
    h)   HELP=true  
         echo "HELP is $HELP"  
         ;;  
   f)    FILE=true  
         echo "FILE is $FILE"  
         ;;  
   c)    VERBOSE=true  
         CHAR=$OPTARG  
	 INDX=$OPTIND
         echo "CHAR is $CHAR"  
	 echo "index is $OPTIND"
         ;;  
   \?)   echo "`basename $0 ` needs -[a|h|f] -c[args] file"  
         ;;  
   esac  
done
