#!/bin/sh
set -e

# Generate apache htaccess configuration file based on list of IPs in ips.txt

{
    echo "Order Deny,Allow
Deny from all"
    awk '{print "Allow from " $0}' ips.txt
} > conf.d/htaccess.txt
