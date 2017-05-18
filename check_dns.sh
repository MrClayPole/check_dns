#!/bin/sh
#
# check_dns - nagios plugin
#
# Writen by Mat Clarke,
#
# 18.05.2017 Version 0.1
#
#
# This tool tests feeds all the nameservers from resolver.conf in to check_dig command
#

#vars
path_dig='/usr/local/libexec/nagios/check_dig'
version='Version 0.1 - 14.12.09'

# call help
if [ "$1" == "" -o "$1" == "-h" ]
then
    echo "$0 - Mat Clarke - $version"
    echo "Usage: $0 <hostname>"

    exit 3
fi


nameserver=$(grep "nameserver" /etc/resolv.conf | sed "s/nameserver //g")
for i in $nameserver
do
 $path_dig -H $i -l $1
done
