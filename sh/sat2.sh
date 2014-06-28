function usage {
  echo "usage: ${0##*/} -a|-cCHANNEL... [-l PATH] SAT_FILE|-sSATELLITE... "
  echo "Options:"
  echo "  -a              Synchronize all channels"
  echo "  -c <CHANNEL>    Channel to be synced"
  echo "  -h              This help"
  echo "  -l <PATH>       Store logfile in PATH"
  echo "                  Default path is /var/log"
  echo "  -s <SATELLITE>  Satellite to be synced"
  echo
  echo "To prevent accidental satellite-sync of all channels, \"-a\" has to be"
  echo "used to explicitly choose to do so"
  echo
  echo "SAT_FILE is a file containing one satellite per line"
  echo
  echo "Example of syncing two channels on all satellites in satellite list:"
  echo "  sudo ${0##*/} -c channel1 -c channel2 my_favorite_satellites"
  echo
  echo "Example of syncing all channels on specified satellites:"
  echo "  sudo ${0##*/} -a -s root@sat1.org -s root@sat2.org"
  echo
  echo "For more details visit https://mojo.redhat.com/docs/DOC-958940. If you"
  echo "have any questions leave me a comment there or send me an e-mail."
  
}

# $DBG controls debugging messages
# 'DBG=whatever'  ->  on
# 'DBG= '         ->  off
DBG=

# Satellite list file
SAT_LIST_FILE="satellite-list"

# Directory containing log files
LOGDIR="/var/log"

# Directory containing temporary logfiles
TMPDIR="/var/tmp"

# Satellite Server host names
SAT_LIST=

# Channel names
CHANNELS=

# Argument parsing
OPA=

#if [ $# -lt 1 ]
#then
#	usage
#fi
if [[ "$1" =~ ^[-]{,2}help$ ]]; then
  usage
fi
while getopts ":ac:dhl:s:" OPTION; do
  case $OPTION in
    a ) OPA=foo
        ;;
    c ) CHANNELS="$CHANNELS $OPTARG"    
	echo "channel name is $CHANNELS"
        ;;  
    # Turns on debuging messages    
    d ) DBG=foo
        ;;
    h ) usage
        exit 0
        ;;
    l ) LOGDIR="$LOGDIR/$OPTARG"
        echo "Log directory has been set to: $LOGDIR" 
        ;;
    # Adds satellites which are going to be synchronized    
    s ) SAT_LIST="$SAT_LIST $OPTARG"
        ;;
    
    * ) echo "Unknown option"
        echo
        usage
        exit 1
        ;;
  esac      
done
echo $OPTIND
shift $((OPTIND - 1))
