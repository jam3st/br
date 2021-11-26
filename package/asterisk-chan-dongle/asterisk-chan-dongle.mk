######################################################
#################################################
############################################3
define ASTERISK_CHAN_DONGLE_BOOSTRAP
	cd $(@D) && ./bootstrap
endef
ASTERISK_CHAN_DONGLE_VERSION = 3d2a97f26ba84473a0926a9fe9a32e451a56bc36
ASTERISK_CHAN_DONGLE_SITE =  $(call github,wdoekes,asterisk-chan-dongle,$(ASTERISK_CHAN_DONGLE_VERSION))
ASTERISK_CHAN_DONGLE_LICENSE = BSD-3-Clause
ASTERISK_CHAN_DONGLE_PRE_CONFIGURE_HOOKS = ASTERISK_CHAN_DONGLE_BOOSTRAP
# Don't do this here as bootstrap does this
ASTERISK_CHAN_DONGLE_AUTORECONF = no
ASTERISK_CHAN_DONGLE_INSTALL_STAGING = YES
ASTERISK_CHAN_DONGLE_DEPENDENCIES = asterisk sqlite

ASTERISK_CHAN_DONGLE_CONF_OPTS = \
	--with-asterisk=$(STAGING_DIR)/usr/include \
	--with-iconv=$(STAGING_DIR)/usr/include \
 	--with-astversion=18 \
	DESTDIR=$(TARGET_DIR)/usr/lib/asterisk/modules

$(eval $(autotools-package))
