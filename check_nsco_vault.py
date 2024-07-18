#!/usr/bin/env python

import os, sys
import subprocess

# NAGIOS return codes :
# https://nagios-plugins.org/doc/guidelines.html#AEN78
OK       = 0
WARNING  = 1
CRITICAL = 2
UNKNOWN  = 3

output = subprocess.check_output('curl -k -I -X GET --header "Accept: application/json" --header "X-TENANT: Test" "https://k8sg-useast1-01a-stage.snap.comcast.net/api/v2/credentials-vault/sdwan-service-activator-plugin_VMD_PRD_MIRROR" 2>&1 | grep -i HTTP', shell=True)

#print (output.rstrip())

if (output.rstrip() == "HTTP/1.1 200 OK"):
    print ( output.rstrip() + " NCSO Credential Vault Functional")
    sys.exit(0)
elif (output.rstrip() != "HTTP/1.1 200 OK"):
    print (output.rstrip() + " NCSO Credential Vault NOT Functional")
    sys.exit(2)
else:
    sys.exit(3)
