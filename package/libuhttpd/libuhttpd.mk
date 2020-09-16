################################################################################
#
# libuhttpd
#
################################################################################

LIBUHTTPD_VERSION = 3.3.0
LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
LIBUHTTPD_LICENSE = MIT
LIBUHTTPD_LICENSE_FILES = LICENSE
LIBUHTTPD_INSTALL_STAGING = YES
LIBUHTTPD_DEPENDENCIES = libev
LIBUHTTPD_CONF_OPTS = -DBUILD_TEST_PLUGIN=OFF

ifeq ($(BR2_PACKAGE_OPENSSL),y)
LIBUHTTPD_DEPENDENCIES += openssl
LIBUHTTPD_CONF_OPTS += \
	-DUHTTPD_SSL_SUPPORT=ON \
	-DUHTTPD_USE_MBEDTLS=OFF \
	-DUHTTPD_USE_OPENSSL=ON \
	-DUHTTPD_USE_WOLFSSL=OFF
else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
LIBUHTTPD_DEPENDENCIES += wolfssl
LIBUHTTPD_CONF_OPTS += \
	-DUHTTPD_SSL_SUPPORT=ON \
	-DUHTTPD_USE_MBEDTLS=OFF \
	-DUHTTPD_USE_OPENSSL=OFF \
	-DUHTTPD_USE_WOLFSSL=ON
else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
LIBUHTTPD_DEPENDENCIES += mbedtls
LIBUHTTPD_CONF_OPTS += \
	-DUHTTPD_SSL_SUPPORT=ON \
	-DUHTTPD_USE_MBEDTLS=ON \
	-DUHTTPD_USE_OPENSSL=OFF \
	-DUHTTPD_USE_WOLFSSL=OFF
else
LIBUHTTPD_CONF_OPTS += -DUHTTPD_SSL_SUPPORT=OFF
endif

# BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
ifeq ($(BR2_SHARED_STATIC_LIBS),y)
LIBUHTTPD_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
else ifeq ($(BR2_SHARED_LIBS),y)
LIBUHTTPD_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
endif

$(eval $(cmake-package))
