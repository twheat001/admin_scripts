#!/usr/bin/perl
use FileHandle;

# IP List file
$file='iplist.txt';

#SNMP Community string and OID
$string="hDaFHJG7";
$oid_1 =".1.3.6.1.4.1.4413.2.2.2.1.18.1.1.2.1.2.10001";
$oid_2 = ".1.3.6.1.4.1.4413.2.2.2.1.18.1.2.1.1.3.10001";

open(FILE, $file);
chomp(@addresses = (<FILE>));
	close(FILE) or die "Could not close $file\n";

foreach $address(@addresses) {

	$output = ` bash -x -c 'ping6 -W2 -c2 $address &>/dev/null && snmpget -Oqn -m ALL -v2c -c $string udp6:[$address] $oid_1 $oid_2 || echo "Cannot pull OID from AP"'`;
	
	#$output =~ s/.*"(.*)\s+?"/"\1"/;
	print "** $address: $output \n";
}
