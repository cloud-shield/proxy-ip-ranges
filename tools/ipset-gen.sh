#!/bin/sh
set -e

# Generate iptables ipset list of IPs from ips.txt

{
   echo "create cloudshield hash:net"
   awk '{print "add cloudshield " $0}' ips.txt
} > conf.d/cs-ipset.txt
