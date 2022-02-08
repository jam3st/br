@ IN SOA ns1.brisl.com. brisl.com. (
0 ; Serial
1H ; refresh
5M ; retry
1D ; expire
5M) ; minimum TTL
@ IN NS ns1.brisl.com.
@ IN NS ns2.brisl.com.
@ IN MX 0 mail.brisl.com.

$INCLUDE /jffs/etc/opendkim/spf-mx.txt
$INCLUDE /jffs/etc/opendkim/adsp.txt
$INCLUDE /jffs/etc/opendkim/dmarc-brisl.txt
$INCLUDE /jffs/etc/opendkim/domainkey-brisl.txt

