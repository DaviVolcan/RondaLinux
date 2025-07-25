BR2_EXTERNAL_$(call qstrip,$(BR2_EXTERNAL))_PATH := $(dir $(lastword $(MAKEFILE_LIST)))
