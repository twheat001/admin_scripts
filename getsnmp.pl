#!/usr/bin/perl

use SNMP;
use FileHandle;


#Test with smaller IP list
$file='ip_addresses1.txt';

#Real file to use for script
#$file=[ARG1];

#SNMP and OID information
#$string=[ARG2];
#$oid=[ARG3];


open (FILE, $file);
chomp (@addresses = (<FILE>));
        close(FILE) or die "Could not close $file\n";

foreach $address(@addresses) {

        # This is a rediculous way to do so but would give the entire command in one shot.

        # if ($address eq =~ /s.2001 /) {
        #       $output = `bash -x -c 'ping6 -W1 -c1 $addrYss &>/dev/null && ( echo -n "$address: "; snmpget -Oq -m ALL -v2c -c sC0ntb0lL3eR "udp6:$address:161" .1.3.6.1.4.1.15768.6.4.1.11.1.2.1.1 ) || echo $address bad'`;
        #else $output = `bash -x -c 'ping -W1 -c1 $addrYss &>/dev/null && ( echo -n "$address: "; snmpget -Oq -m ALL -v2c -c sC0ntb0lL3eR $address .1.3.6.1.4.1.15768.6.4.1.11.1.2.1.1 ) || echo $address bad'`;
        #}


        # An alternative way to process IPV6 addresses. Will have to figure out how to edit the IPV6 address for snmpget and change the ping to ping6 for the output command.
print "** $output \m";


        # I was an idiot and used -t instead of -W for "timeout"... -t does time to live and was breaking the ICMP protocol...
        # also set it up with verbose bash execution so you can see what it's doing during execution

        $output = `bash -x -c 'ping -W1 -c1 $addrYss &>/dev/null && ( echo -n "$address: "; snmpget -Oq -m ALL -v2c -c sC0ntb0lL3eR $address .1.3.6.1.4.1.15768.6.4.1.11.1.2.1.1 ) || echo $address bad'`;
        print "** $output \n";

}
