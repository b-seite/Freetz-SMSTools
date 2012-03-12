$(call PKG_INIT_BIN, 3.1.14)
$(PKG)_SOURCE := $(pkg)-$($(PKG)_VERSION).tar.gz
$(PKG)_SOURCE_MD5 := e0f9f84240f0db9a286aa3a5fa3bd8fb
$(PKG)_SITE := http://smstools3.kekekasvi.com/packages/

$(PKG)_BINARY:=$($(PKG)_DIR)/smstools3
$(PKG)_TARGET_BINARY:=$($(PKG)_DEST_DIR)/usr/bin/smstools3


PTHREAD_LDFLAGS := -lpthread

$(PKG)_CONFIGURE_PRE_CMDS += $(call PKG_PREVENT_RPATH_HARDCODING,./configure)


$(PKG_SOURCE_DOWNLOAD)
$(PKG_UNPACKED)
$(PKG_CONFIGURED_CONFIGURE)

$($(PKG)_BINARY): $($(PKG)_DIR)/.configured
	$(SUBMAKE) -C $(SMSTOOLS3_DIR) -f makefile.unix CXX="$(TARGET_CXX)" CXXFLAGS="$(TARGET_CFLAGS)" DEFINES="" LDFLAGS="$(SMSTOOLS3_LDFLAGS)"
	
$($(PKG)_TARGET_BINARY): $($PKG)_BINARY)
		$(INSTALL_BINARY_STRIP)

$(pkg):

$(pkg)-precompiled: $($(PKG)_TARGET_BINARY)

$(pkg)-clean:
	-$(SUBMAKE) -C $(SMSTOOLS3_DIR)  -f makefile.unix clean
	

$(pkg)-uninstall:
	$(RM) $(SMSTOOLS3_TARGET_BINARY)

$(PKG_FINISH)
