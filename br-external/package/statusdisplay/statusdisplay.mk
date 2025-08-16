################################################################################
#
# StatusDisplay
#
################################################################################

STATUSDISPLAY_VERSION = 1.0
STATUSDISPLAY_SITE = $(BR2_EXTERNAL_RONDA_EXTERNAL_PATH)/package/statusdisplay/src
STATUSDISPLAY_SITE_METHOD = local
STATUSDISPLAY_LICENSE = GPL-2.0+
STATUSDISPLAY_LICENSE_FILES = LICENSE

define STATUSDISPLAY_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
endef

define STATUSDISPLAY_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/statusdisplay $(TARGET_DIR)/usr/bin/statusdisplay
endef

$(eval $(generic-package))