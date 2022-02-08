@ IN SOA ns1.goggix.com. goggix.com. (
0 ; Serial
1H ; refresh
5M ; retry
1D ; expire
5M) ; minimum TTL
@ IN NS ns1.goggix.com.
@ IN NS ns2.goggix.com.
@ IN MX 0 mail.brisl.com.

$INCLUDE /jffs/etc/opendkim/spf-mx.txt
$INCLUDE /jffs/etc/opendkim/adsp.txt
$INCLUDE /jffs/etc/opendkim/dmarc-goggix.txt
$INCLUDE /jffs/etc/opendkim/domainkey-goggix.txt
