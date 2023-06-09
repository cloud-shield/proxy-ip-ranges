#!/bin/sh
set -e

# Generate nginx access configuration file based on list of IPs in ips.txt

{
   echo "# cloud-shield filters IPs"
   awk '{print "allow " $0 ";"}' ips.txt
   echo "deny all;"
} > conf.d/cs-access-nginx.conf
