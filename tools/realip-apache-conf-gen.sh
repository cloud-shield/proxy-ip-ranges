#!/bin/sh
set -e

# Generate apache realip configuration file based on list of IPs in ips.txt

{
    echo "<IfModule !mod_remoteip.c>
    LoadModule remoteip_module modules/mod_remoteip.so
</IfModule>
<IfModule mod_remoteip.c>
    # cloud-shield filters IPs"
    awk '{print "    RemoteIPTrustedProxy " $0}' ips.txt
    echo "</IfModule>"
} > conf.d/cs-realip-apache.conf
