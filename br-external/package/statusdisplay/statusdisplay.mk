################################################################################
#
# StatusDisplay
#
################################################################################

STATUSDISPLAY_VERSION = 1.0
STATUSDISPLAY_SITE = $(BR2_EXTERNAL_RONDA_EXTERNAL_PATH)/package/statusdisplay
STATUSDISPLAY_SITE_METHOD = local
STATUSDISPLAY_LICENSE = GPL-2.0+
STATUSDISPLAY_LICENSE_FILES = LICENSE

STATUSDISPLAY_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release

$(eval $(cmake-package))