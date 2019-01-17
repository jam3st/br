ASTDONGLE_VERSION = 1.1-20180619
ASTDONGLE_SOURCE = asterisk-chan-dongle-$(ASTDONGLE_VERSION).tar.xz
ASTDONGLE_SITE = https://github.com/wdoekes/asterisk-chan-dongle
ASTDONGLE_LICENSE = BSD-3-Clause
ASTDONGLE_LICENSE_FILES = LICENSE
ASTDONGLE_INSTALL_STAGING = YES
ASTDONGLE_DEPENDENCIES = asterisk
ASTDONGLE_CONF_OPTS = \
	 -with-astversion=13 \
	 --with-asterisk=$(STAGING_DIR)/usr/include/asterisk \

$(eval $(autotools-package))
