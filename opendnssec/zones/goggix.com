$TTL 1M
@ IN SOA ns1.goggix.com. goggix.com. (
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

$INCLUDE /jffs/etc/opendkim/spf-mx.txt                                                
$INCLUDE /jffs/etc/opendkim/adsp.txt                                                 
$INCLUDE /jffs/etc/opendkim/dmarc-goggix.txt                                              
$INCLUDE /jffs/etc/opendkim/domainkey-goggix.txt

github          IN   NS     ns1
github          IN   NS     ns2
$INCLUDE /tmp/sda/opendnssec/dsset/github.goggix.com

pataxi          IN   NS     ns1
pataxi          IN   NS     ns2
$INCLUDE /tmp/sda/opendnssec/dsset/pataxi.goggix.com
