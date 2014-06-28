#!/bin/bash
SECS=0
MINUTES=0
HOURS=0
DAYS=0
PROCESS=0
while getopts :s:m:h:d:p: TIMED 2>/dev/null
do
        case $TIMED in
        s) SECS=$OPTARG
           ;;
        m) ((MINUTES=$OPTARG*60))
           ;;
        h) ((HOURS=$OPTARG*3600))
           ;;
        d) ((DAYS=$OPTARG*86400))
           ;;
        p) PROCESS=$OPTARG
           ;;
        \?) usage
           exit;
          ;;
        esac
done
((TOTALSECS=$SECS+$MINUTES+$HOURS+$DAYS))
echo "total seconds:$TOTALSECS"
