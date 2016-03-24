include $(TOPDIR)/rules.mk

PKG_NAME:=fftdf-debug
PKG_VERSION:=1
PKG_RELEASE:=$(GLUON_VERSION).$(GLUON_SITE_CODE)-$(GLUON_RELEASE).$(GLUON_CONFIG_VERSION)

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/fftdf-debug
  SECTION:=fftdf
  CATEGORY:=debug
  TITLE:=Debug scripts for Freifunk Troisdorf
  DEPENDS:=+gluon-core +ubus +libubox +busybox
  MAINTAINER:=Freifunk Troisdorf <stefan@freifunk-troisdorf.de>
  URL:=https://github.com/Freifunk-Troisdorf/packages
  SOURCE:=git@github.com:Freifunk-Troisdorf/packages.git
endef

define Package/fftdf-debug/description
	Debug scripts for fftdf
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/ffho-debug/install
	$(INSTALL_DIR) $(1)/bin/
	$(INSTALL_BIN) ./files/bin/* $(1)/bin/
	$(INSTALL_DIR) $(1)/usr/lib/micron.d/
	$(INSTALL_DATA) ./files/usr/lib/micron.d/* $(1)/usr/lib/micron.d/
endef

$(eval $(call BuildPackage,fftdf-debug))
