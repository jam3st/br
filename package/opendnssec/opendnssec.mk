################################################################################
#
# opendnssec
#
################################################################################

OPENDNSSEC_VERSION = 2.1.10
OPENDNSSEC_SOURCE = opendnssec-$(OPENDNSSEC_VERSION).tar.gz
OPENDNSSEC_SITE = http://www.nlnetlabs.nl/downloads/opendnssec
OPENDNSSEC_LICENSE = BSD-3-Clause
OPENDNSSEC_LICENSE_FILES = LICENSE
OPENDNSSEC_CPE_ID_VENDOR = nlnetlabs
OPENDNSSEC_CPE_ID_PRODUCT = ldns
OPENDNSSEC_INSTALL_STAGING = YES
OPENDNSSEC_DEPENDENCIES = libxml2 libldns softhsm
OPENDNSSEC_AUTORECONF = YES
OPENDNSSEC_CONF_OPTS = \
        --enable-installation-user=opendnssec \
        --enable-installation-group=opendnssec \
	--enable-signer \
        --without-cunit \
        --disable-static \
	--with-libxml2=$(STAGING_DIR)/usr \
	--with-ldns=$(STAGING_DIR)/usr \
	--with-softhsm=$(STAGING_DIR)/usr/lib/softhsm/libsofthsm2.so \
        --with-enforcer-database=sqlite3

# the linktest make target fails with static linking, and we are only
# interested in the lib target anyway


OPENDNSSEC_MAKE_OPTS = all

$(eval $(autotools-package))
