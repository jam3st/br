################################################################################
#
# opendmarc
#
################################################################################

OPENDMARC_VERSION = rel-opendmarc-1-4-1-1
OPENDMARC_SITE = $(call github,trusteddomainproject,OpenDMARC,$(OPENDMARC_VERSION))
OPENDMARC_LICENSE = BSD-3-Clause
OPENDMARC_LICENSE_FILES = LICENSE
OPENDMARC_INSTALL_STAGING = YES
OPENDMARC_DEPENDENCIES = libmilter libspf2
OPENDMARC_AUTORECONF = YES
OPENDMARC_CONF_OPTS = --disable-static \
	--with-milter=$(STAGING_DIR)/usr

$(eval $(autotools-package))
