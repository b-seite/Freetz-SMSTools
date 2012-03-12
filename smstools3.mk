$(call PKG_INIT_BIN, 3.1.14)
$(PKG)_SOURCE := $(pkg)-$($(PKG)_VERSION).tar.gz
$(PKG)_SOURCE_MD5 := e0f9f84240f0db9a286aa3a5fa3bd8fb
$(PKG)_SITE := http://smstools3.kekekasvi.com/packages/




PTHREAD_LDFLAGS := -lpthread

$(PKG)_CONFIGURE_PRE_CMDS += $(call PKG_PREVENT_RPATH_HARDCODING,./configure)


$(PKG_SOURCE_DOWNLOAD)
$(PKG_UNPACKED)
$(PKG_CONFIGURED_CONFIGURE)


$(pkg):

$(pkg)-precompiled: $($(PKG)_LIBS_TARGET_DIR) $($(PKG)_BINS_AFPD_TARGET_DIR) $($(PKG)_BINS_DBD_TARGET_DIR)

$(pkg)-clean:
	-$(SUBMAKE) -C $(NETATALK_DIR) clean
	$(RM) $(NETATALK_FREETZ_CONFIG_FILE)

$(pkg)-uninstall:
	$(RM) $(NETATALK_LIBS_TARGET_DIR) $(NETATALK_BINS_AFPD_TARGET_DIR) $(NETATALK_BINS_DBD_TARGET_DIR)

$(PKG_FINISH)
