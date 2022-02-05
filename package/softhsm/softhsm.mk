################################################################################
#
# softhsm
#
################################################################################

SOFTHSM_VERSION = 2.6.1
SOFTHSM_SOURCE = softhsm-$(SOFTHSM_VERSION).tar.gz
SOFTHSM_SITE = http://www.nlnetlabs.nl/downloads/softhsm
SOFTHSM_LICENSE = BSD-3-Clause
SOFTHSM_LICENSE_FILES = LICENSE
SOFTHSM_CPE_ID_VENDOR = nlnetlabs
SOFTHSM_CPE_ID_PRODUCT = ldns
SOFTHSM_INSTALL_STAGING = YES
SOFTHSM_DEPENDENCIES = openssl
SOFTHSM_AUTORECONF = YES
SOFTHSM_CONF_OPTS = \
        --disable-static \
	--with-crypto-backend=openssl \
	--enable-ecc \
	--disable-p11-kit \
	--localstatedir="/run/softhsm/"

$(eval $(autotools-package))
