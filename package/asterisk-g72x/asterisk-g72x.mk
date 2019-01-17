AST729_VERSION = 1.4.2
AST729_SOURCE = asterisk-g72x-$(AST729_VERSION).tar.bz2
AST729_SITE = http://asterisk.hosting.lv/src/
AST729_LICENSE = BSD-3-Clause
AST729_LICENSE_FILES = LICENSE
AST729_INSTALL_STAGING = YES
AST729_DEPENDENCIES = asterisk
AST729_CONF_OPTS = \
	--with-bcg729 \
	--enable-shared \
	--with-asterisk130 \
	 --with-asterisk-includes=$(STAGING_DIR)/usr/include/asterisk \

$(eval $(autotools-package))
