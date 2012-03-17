$(call PKG_INIT_BIN, 3.1.14)
$(PKG)_SOURCE := $(pkg)-$($(PKG)_VERSION).tar.gz
$(PKG)_SOURCE_MD5 := 7d9927575000d9644d01e430cacf768d
$(PKG)_SITE := http://www.beplate.de/dl

$(PKG)_BINARY:=$($(PKG)_DIR)/src/smsd
$(PKG)_TARGET_BINARY:=$($(PKG)_DEST_DIR)/usr/bin/smsd


$(PKG_SOURCE_DOWNLOAD)
$(PKG_UNPACKED)
$(PKG_CONFIGURED_NOP)

$($(PKG)_BINARY): $($(PKG)_DIR)/.configured
	$(SUBMAKE) -C $(SMSTOOLS3_DIR) \
		CC="$(TARGET_CC)" 
		

$($(PKG)_TARGET_BINARY): $($(PKG)_BINARY)
	$(INSTALL_BINARY_STRIP)

$(pkg):

$(pkg)-precompiled: $($(PKG)_TARGET_BINARY)

$(pkg)-clean:
	-$(SUBMAKE) -C $(SMSTOOLS3_DIR)
	$(RM) $(SMSTOOLS3_DIR)/.configured

$(pkg)-uninstall:
	$(RM) $(SMSTOOLS3_TARGET_BINARY)

$(PKG_FINISH)
