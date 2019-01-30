ASTERISK_G729_VERSION = 1.4.3
ASTERISK_G729_SOURCE = asterisk-g72x-$(ASTERISK_G729_VERSION).tar.bz2
ASTERISK_G729_SITE = http://asterisk.hosting.lv/src
ASTERISK_G729_AUTORECONF = YES
ASTERISK_G729_INSTALL_STAGING = YES
ASTERISK_G729_DEPENDENCIES = asterisk bcg729
ASTERISK_G729_CONF_OPTS = \
	--with-bcg729 \
	--enable-shared \
	--with-asterisk160 \
	--with-asterisk-includes=$(STAGING_DIR)/usr/include/

$(eval $(autotools-package))
