######################################################
#################################################
############################################3
define ASTERISK_CHAN_DONGLE_BOOSTRAP
	cd $(@D) && ./bootstrap
endef
ASTERISK_CHAN_DONGLE_VERSION = master
ASTERISK_CHAN_DONGLE_SITE =  $(call github,wdoekes,asterisk-chan-dongle,$(ASTERISK_CHAN_DONGLE_VERSION))
ASTERISK_CHAN_DONGLE_LICENSE = BSD-3-Clause
ASTERISK_CHAN_DONGLE_PRE_CONFIGURE_HOOKS = ASTERISK_CHAN_DONGLE_BOOSTRAP
ASTERISK_CHAN_DONGLE_AUTORECONF = yes
ASTERISK_CHAN_DONGLE_INSTALL_STAGING = YES
ASTERISK_CHAN_DONGLE_DEPENDENCIES = asterisk

ASTERISK_CHAN_DONGLE_CONF_OPTS = \
	 --with-astversion=13 \
	 --with-asterisk=$(STAGING_DIR)/usr/include \
	 --oldincludedir=$(STAGING_DIR)/usr/include \
	 --includedir=$(STAGING_DIR)/usr/include \
	 DESTDIR=$(TARGET_DIR)/usr/lib/asterisk/modules

$(eval $(autotools-package))
