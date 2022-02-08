$TTL 1M
@ IN SOA ns1.f0xi.com. f0xi.com. (
0 ; Serial
4H ; refresh
1H ; retry
7D ; expire
1M)     ; minimum
@ IN NS ns1
@ IN NS ns2
@ IN MX 0 mail.brisl.com.

ns1 IN A 104.128.228.205
ns2 IN A 168.235.102.105

wg IN A 104.128.228.205

$INCLUDE /jffs/etc/opendkim/spf-mx.txt                                                
$INCLUDE /jffs/etc/opendkim/adsp.txt                                                 
$INCLUDE /jffs/etc/opendkim/dmarc-f0xi.txt                                              
$INCLUDE /jffs/etc/opendkim/domainkey-f0xi.txt
