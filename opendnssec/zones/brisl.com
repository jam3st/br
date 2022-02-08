$TTL 1M
@ IN SOA ns1.brisl.com. brisl.com. (
0 ;
4H ;
1H ; 
7D ; 
1M) ;
@ IN NS ns1
@ IN NS ns2
@ IN MX 0 mail

ns1 IN A 104.128.228.205
ns2 IN A 168.235.102.105
mail IN A 168.235.102.105
mail IN A 104.128.228.205

zoom IN A 192.168.1.10

la IN A 104.128.228.205
ny IN A 168.235.102.105

$INCLUDE /jffs/etc/opendkim/spf-mx.txt
$INCLUDE /jffs/etc/opendkim/adsp.txt
$INCLUDE /jffs/etc/opendkim/dmarc-brisl.txt
$INCLUDE /jffs/etc/opendkim/domainkey-brisl.txt
droid IN NS ns1
droid IN NS ns2
$INCLUDE /tmp/sda/opendnssec/dsset/droid.brisl.com
phone IN NS ns1
phone IN NS ns2
$INCLUDE /tmp/sda/opendnssec/dsset/phone.brisl.com
thomo IN NS ns1
thomo IN NS ns2
$INCLUDE /tmp/sda/opendnssec/dsset/thomo.brisl.com
gthub IN NS ns1
gthub IN NS ns2
$INCLUDE /tmp/sda/opendnssec/dsset/gthub.brisl.com
apple IN NS ns1
apple IN NS ns2
$INCLUDE /tmp/sda/opendnssec/dsset/apple.brisl.com

$INCLUDE /tmp/sda/opendnssec/tmp/mail.brisl.com.tlsa
$INCLUDE /tmp/sda/opendnssec/tmp/brisl.com.acme
$INCLUDE /tmp/sda/opendnssec/tmp/brisl.com.au
