include $(TOPDIR)/rules.mk

PKG_NAME:=tro-nightswitch
PKG_VERSION:=2
PKG_RELEASE:=2

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/tro-nightswitch
  SECTION:=daemon
  CATEGORY:=Freifunk Troisdorf
  TITLE:=Switch Wifi
endef

define Package/tro-nightswitch/description
	Switch Wifi
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/tro-nightswitch/install
	$(INSTALL_DIR) $(1)/usr/lib/micron.d/
	$(INSTALL_DATA) files/usr/lib/micron.d/nightswitch $(1)/usr/lib/micron.d/nightswitch
	$(INSTALL_DIR) $(1)/lib/tro/nightswitch/
	$(INSTALL_BIN) files/lib/tro/nightswitch/nightswitch.sh $(1)/lib/tro/nightswitch/
endef

$(eval $(call BuildPackage,tro-nightswitch))
