################################################################################
#
# libmilter
#
################################################################################

LIBMILTER_SENDMAIL_VERSION = 8.17.1
LIBMILTER_VERSION = 1.0.2
LIBMILTER_SOURCE = sendmail.$(LIBMILTER_SENDMAIL_VERSION).tar.gz
LIBMILTER_SITE = http://ftp.sendmail.org/pub/sendmail
LIBMILTER_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
LIBMILTER_LICENSE_FILES = COPYING
LIBMILTER_INSTALL_TARGET = YES
LIBMILTER_INSTALL_STAGING = YES

ENVDEF=-DNETUNIX -DNETINET -DHAS_GETHOSTBYNAME -DNETINET6 -DSM_CONF_POLL=1 -DNEEDSGETIPNODE

define LIBMILTER_BUILD_CMDS
	cat $(@D)/devtools/Site/site.config.m4 
	sed -e "s|@@CC@@|$(TARGET_CC)|" \
       		-e "s|@@CFLAGS@@|$(TARGET_CFLAGS)|" \
    		-e "s|@@LDFLAGS@@|$(TARGET_LDFLAGS)|" \
      		-e "s|@@ENVDEF@@|$(ENVDEF)|" \
		-i $(@D)/devtools/Site/site.config.m4
	cat $(@D)/devtools/Site/site.config.m4 
	
	make -j1 -C $(@D)/libmilter MILTER_SOVER=$(LIBMILTER_VERSION)
endef
		
define LIBMILTER_INSTALL_TARGET_CMDS
	make -j1 -C $(@D)/obj.*/libmilter DESTDIR=$(TARGET_DIR) MANROOT=$(TARGET_DIR)/mandelete/ MILTER_SOVER=$(LIBMILTER_VERSION) install-libmilter
#	rm -rf $(TARGET_DIR)/mandelete
endef

define LIBMILTER_INSTALL_STAGING_CMDS
	make -j1 -C $(@D)/obj.*/libmilter DESTDIR=$(STAGING_DIR) MANROOT=$(TARGET_DIR)/ MILTER_SOVER=$(LIBMILTER_VERSION) install-mfapi
	make -j1 -C $(@D)/obj.*/libmilter DESTDIR=$(STAGING_DIR) MANROOT=$(TARGET_DIR)/mandelete/ MILTER_SOVER=$(LIBMILTER_VERSION) install-libmilter
endef

$(eval $(generic-package))
