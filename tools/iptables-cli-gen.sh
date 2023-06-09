#!/bin/sh
set -e

# Generate iptables commands with list of IPs from ips.txt

{
   echo "# Allow cloud-shield to access the web server"
   awk '{print "iptables -I INPUT -p tcp -m multiport --dports 80,443 -s " $0 " -j ACCEPT"}' ips.txt
   echo "# Reject all other incoming connections
iptables -I INPUT -p tcp -m multiport --dports 80,443 -j REJECT"
} > conf.d/cs-iptables-cli.txt
