#/bin/bash
echo $0
echo $*
while getopts ":a:bc" opt
do
        case $opt in
                a )
                        echo $OPTARG                    
                        echo $OPTIND;;
                b )
                        echo "b $OPTIND";;
                c )
                        echo "c $OPTIND";;
                ? )
                        echo "error"                    
                        exit 1;;
                esac
done
echo $OPTIND
echo $*
shift $(($OPTIND - 1))
echo $*
echo $0
