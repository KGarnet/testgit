 #!/bin/bash  
 if [[ $# -lt 1 ]];then  
     echo "USAGE:`basename $0` [-a] [-b value] [-c]"  
     exit 1  
 fi    
    
 while getopts :ab:c name  
 do  
     case $name in  
         a)  aflag=1  
         echo "a"  
	    echo "optarg's value is :" $OPTARG
	    echo "optindex's value is :" $OPTIND
         ;;  
         b)  bflag=1  
   
         if [[ ${OPTARG:0:1} = "-" ]]; then  
             echo "invalid parameter of $OPTARG"  
             exit 1  
         fi  
   
	    echo "optarg's value is :" $OPTARG
	    echo "optindex's value is :" $OPTIND
         bval=$OPTARG  
         ;;  
         c)  cflag=1  
         echo "c"  
         ;;  
         \?) echo "Invalid option :`basename $0` [-a] [-b value] [-c]"  
	    echo "optarg's value is :" $OPTARG
         exit 1  
         ;;  
         :) echo "argument for optin -$OPTARG is missing"
	    echo "$0:Must supply an argument to -$OPTARG."  
	    echo "optarg's value is :" $OPTARG
         exit 1  
         ;;  
     esac  
 done  
 echo $bval 
