include $(TOPDIR)/rules.mk

PKG_NAME:=tro-offline_ssid
PKG_VERSION:=1
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/tro-offline_ssid
  SECTION:=daemon
  CATEGORY:=Freifunk Troisdorf
  TITLE:=Changes SSID when Node is offline 
endef

define Package/tro-offline_ssid/description
	Changes SSID when Node is offline
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/tro-offline_ssid/install
	$(INSTALL_DIR) $(1)/lib/gluon/cron/
	$(INSTALL_DATA) files/lib/gluon/cron/offline_ssid $(1)/lib/gluon/cron/offline_ssid
	$(INSTALL_DIR) $(1)/lib/tro/offline_ssid/
	$(INSTALL_BIN) files/lib/tro/offline_ssid/offline_ssid.sh $(1)/lib/tro/offline_ssid/
endef

$(eval $(call BuildPackage,tro-netwatch))
