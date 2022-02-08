################################################################################
#
# libspf2
#
################################################################################

LIBSPF2_VERSION = 4915c308d57ff3abac9fb241f09c4bed2ab54815
LIBSPF2_SITE = $(call github,shevek,libspf2,$(LIBSPF2_VERSION))
LIBSPF2_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
LIBSPF2_LICENSE_FILES = COPYING
LIBSPF2_INSTALL_TARGET = YES
LIBSPF2_AUTORECONF =YES
LIBSPF2_DRIVERS_CONF_OPTS = --disable-static

define LIBSPF2_POST_PATCH_CMDS
	sed -i -e '/bin_PROGRAMS/s/spfquery_static//' $(@D)/src/spfquery/Makefile.am \
		-e '/bin_PROGRAMS/s/spftest_static//' $(@D)/src/spftest/Makefile.am \
		-e '/bin_PROGRAMS/s/spfd_static//' $(@D)/src/spfd/Makefile.am \
		-e '/bin_PROGRAMS/s/spf_example_static//' $(@D)/src/spf_example/Makefile.am \
		|| die

	sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' $(@D)/configure.ac

endef

LIBSPF2_POST_PATCH_HOOKS = LIBSPF2_POST_PATCH_CMDS

$(eval $(autotools-package))

