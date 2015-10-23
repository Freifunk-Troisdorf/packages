include $(TOPDIR)/rules.mk

PKG_NAME:=tro-netwatch
PKG_VERSION:=2
PKG_RELEASE:=2

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/tro-netwatch
  SECTION:=daemon
  CATEGORY:=Freifunk Troisdorf
  TITLE:=Checks Network status 
endef

define Package/tro-netwatch/description
	Checks Network status
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/tro-netwatch/install
	$(INSTALL_DIR) $(1)/usr/lib/micron.d/
	$(INSTALL_DATA) files/usr/lib/micron.d/netwatch $(1)/usr/lib/micron.d/netwatch
	$(INSTALL_DIR) $(1)/lib/tro/netwatch/
	$(INSTALL_BIN) files/lib/tro/netwatch/netwatch.sh $(1)/lib/tro/netwatch/
endef

$(eval $(call BuildPackage,tro-netwatch))
