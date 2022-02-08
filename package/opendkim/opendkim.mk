################################################################################
#
# opendkim
#
################################################################################

OPENDKIM_VERSION = 2.10.3
OPENDKIM_SOURCE = opendkim-$(OPENDKIM_VERSION).tar.gz
OPENDKIM_SITE = https://downloads.sourceforge.net/project/opendkim
OPENDKIM_LICENSE = BSD-3-Clause
OPENDKIM_LICENSE_FILES = LICENSE
OPENDKIM_CPE_ID_VENDOR = nlnetlabs
OPENDKIM_CPE_ID_PRODUCT = ldns
OPENDKIM_INSTALL_STAGING = YES
OPENDKIM_DEPENDENCIES = libmilter
OPENDKIM_AUTORECONF = YES

OPENDKIM_CONF_OPTS = \
	--enable-poll \
	--without-db \
	--without-gcov \
	--without-gprof \
	--without-lcov \
        --enable-filter \
        --with-milter \
        --enable-atps \
        --enable-identity_header \
        --enable-rate_limit \
        --enable-resign \
        --enable-replace_rules \
        --enable-default_sender \
        --enable-sender_macro \
        --enable-vbr \
        --disable-live-testing


$(eval $(autotools-package))
