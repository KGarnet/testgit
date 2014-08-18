#!/bin/bash
test=${1##*/}
echo "test is:" $test
        if [ "$1" = "-p" ]; then
                pid_file=$2
		echo  '2nd is $pid_file', $pid_file
                shift 2
        fi
        if [ "$1" = "-l" ]; then
                lock_file=$2
                shift 2
        fi
        if [ "$1" = "-b" ]; then
                if [ -z $pid_file ]; then
                        echo $"-b option can be used only with -p"
                        echo $"Usage: status -p pidfile -b binary program"
                        return 1
                fi
                binary=$2
                shift 2
        fi
               base=${1##*/} 
       echo $base
