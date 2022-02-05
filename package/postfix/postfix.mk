################################################################################
#
# postfix
#
################################################################################

POSTFIX_VERSION = 3.6.4
POSTFIX_SOURCE = postfix-$(POSTFIX_VERSION).tar.gz
POSTFIX_SITE = http://ftp.porcupine.org/mirrors/postfix-release/official
POSTFIX_INSTALL_STAGING = YES
POSTFIX_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
POSTFIX_LICENSE_FILES = COPYING COPYING.LGPL COPYING.MIT
POSTFIX_DEPENDENCIES = \
	openssl

#CCARGS=-I${@D}/src/util -DNO_NIS -fcommon -DDEF_DB_TYPE=\"cdb\"
CCARGS= -DNO_NIS -fcommon -DNO_DB -DNO_NIS
AUXLIBS=-L$(STAGING_DIR)/usr/lib

CCARGS+= -DUSE_SASL_AUTH -DDEF_SERVER_SASL_TYPE=\"dovecot\"

CCARGS+=-DHAS_PCRE -I$(STAGING_DIR)/usr/include/
AUXLIBS+=-L$(STAGING_DIR)/usr/lib -lpcre

CCARGS +=-DHAS_SQLITE -I$(STAGING_DIR)/usr/include/
AUXLIBS +=-L$(STAGING_DIR)/usr/lib -lsqlite3 -lpthread

CCARGS+=-DUSE_TLS
AUXLIBS+=-lssl -lcrypto

define POSTFIX_CONFIGURE_CMDS
	$(MAKE) shared=yes dynamicmaps=no pie=yes shlib_directory=/usr/lib/postfix CCARGS='$(CCARGS)' $(TARGET_CONFIGURE_OPTS) AUXLIBS="$(AUXLIBS)" -C $(@D) makefiles
endef

define POSTFIX_BUILD_CMDS
	$(MAKE) -C $(@D)
endef

config_directory=/etc/postfix
sample_directory=/etc/postfix
command_directory=/usr/sbin
daemon_directory=/usr/libexec/postfix
html_directory=no
manpage_directory=/mandelete
readme_directory=no
sendmail_path=/usr/sbin/sendmail
newaliases_path=/usr/bin/newaliases
mailq_path=/usr/bin/mailq
shlib_directory=/usr/lib/postfix
meta_directory=/etc/postfix
data_directory=/run/var/lib/postfix
queue_directory=/run/spool/postfix
mail_spool_directory=/run/mail

define POSTFIX_INSTALL_TARGET_CMDS
        $(MAKE) install_root=$(TARGET_DIR) command_directory=$(command_directory) daemon_directory=$(daemon_directory) data_directory=$(data_directory) html_directory=$(html_directory) mail_owner=postfix mailq_path=$(mailq_path)$(ln_suffix) manpage_directory=$(manpage_directory) newaliases_path=$(newaliases_path)$(ln_suffix) queue_directory=$(queue_directory) readme_directory=$(readme_directory) sendmail_path=$(sendmail_path)$(ln_suffix) setgid_group=postdrop sample_directory=$(sample_directory) config_directory=$(config_directory) shlib_directory=$(shlib_directory) meta_directory=$(meta_directory) mail_version=$(POSTFIX_VERSION) -C $(@D) non-interactive-package
	rm -rf $(TARGET_DIR)/mandelete
endef


$(eval $(generic-package))
