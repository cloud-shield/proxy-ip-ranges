#!/bin/sh
set -e

# Generate nginx realip configuration file based on list of IPs in ips.txt

{
   echo "# cloud-shield filters IPs"
   awk '{print "set_real_ip_from " $0 ";"}' ips.txt
   echo "real_ip_header CS-Connecting-IP;"
} > conf.d/cs-realip-nginx.conf
