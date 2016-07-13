include $(TOPDIR)/rules.mk

PKG_NAME:=tro-nightboot
PKG_VERSION:=1
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/tro-nightboot
  SECTION:=daemon
  CATEGORY:=Freifunk Troisdorf
  TITLE:=Reboots node at night 
endef

define Package/tro-nightboot/description
	Reboots node at night
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/tro-nightboot/install
	$(INSTALL_DIR) $(1)/usr/lib/micron.d/
	$(INSTALL_DATA) files/usr/lib/micron.d/nightboot $(1)/usr/lib/micron.d/nightboot
	$(INSTALL_DATA) files/usr/lib/micron.d/nightboot $(1)/usr/lib/micron.d/wifi
endef

$(eval $(call BuildPackage,tro-nightboot))
