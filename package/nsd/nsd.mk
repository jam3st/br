################################################################################
#
# libldns
#
################################################################################

NSD_VERSION = 4.1.26
NSD_SOURCE = nsd-$(NSD_VERSION).tar.gz
NSD_SITE = http://www.nlnetlabs.nl/downloads/nsd
NSD_LICENSE = BSD-3-Clause
NSD_LICENSE_FILES = LICENSE
NSD_INSTALL_STAGING = YES
NSD_DEPENDENCIES = openssl
# --disable-dane-verify can be removed after openssl bump to 1.1.x
NSD_CONF_OPTS = \
	--with-ssl=$(STAGING_DIR)/usr \
	--disable-bind8-stats \
	--disable-zone-stats \
	--disable-minimal-responses \
	--disable-mmap \
	--disable-root-server \
	--enable-nsec3

ifeq ($(BR2_STATIC_LIBS),y)
NSD_DEPENDENCIES += host-pkgconf
# missing -lz breaks configure, add it using pkgconf
NSD_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs openssl`"
endif

# the linktest make target fails with static linking, and we are only
# interested in the lib target anyway
#NSD_MAKE_OPTS = lib

$(eval $(autotools-package))
