#!/bin/bash
#touch /tmp/$(basename $0).$$
echo "success" > /tmp/$(basename $0).$$
if !(grep -i SUCCESS /tmp/$(basename $0).$$)
 then  echo "yes"
else echo "no"
fi
