CONFIGDIR = /usr/share/mkimage

include $(CONFIGDIR)/config.mk

GLOBAL_TARGET=arm
GLOBAL_HSH_USE_QEMU = arm
GLOBAL_HSH_APT_CONFIG = apt.conf
IMAGE_PACKAGES = packages
IMAGE_NAME = chainmail-arm

MKI_TOOLSDIR_LOCAL = tools

#INSTALL_FEATURES =
#INSTALL_FEATURES += setup-openldap
#INSTALL_FEATURES += nfs-server-stage3
#INSTALL_FEATURES += network-shares-stage3
#INSTALL_FEATURES += powerbutton-stage3
#INSTALL_FEATURES += apache2-userdir-stage3
#INSTALL_FEATURES += apache2-indexhtml-stage3
#INSTALL_FEATURES += ulogd-stage3
#INSTALL_FEATURES += hotstandby-stage3
#INSTALL_FEATURES += mail-init-stage3
#INSTALL_FEATURES += snort-stage3
#INSTALL_FEATURES += osec-log-stage3
#INSTALL_FEATURES += resolver-bind-stage3
#INSTALL_FEATURES += services

#INSTALLER_AUX =
#INSTALLER_AUX += installer-distro-centaurus-stage2

MKI_PACK_RESULTS = tar:arm-root.tar
MKI_IMAGE_SCRIPTDIR = scripts.d
#VERBOSE=-v

INSTALLER_MOUNTPOINTS = /sys,/proc

include $(CONFIGDIR)/targets.mk
#include installer-batch.mk
#include fix-root.mk

COPY_TREE=image.in/
#all: build-image run-image-scripts batch-install fix-root pack-image
all: build-image run-image-scripts copy-tree pack-image

prepare: apt.conf

apt.conf:
	echo 'Dir::Etc::SourceList "$(CURDIR)/sources.list";' > apt.conf

dailypack: .work/.out/arm-root.tar
	gzip -9c .work/.out/arm-root.tar > ~/$(IMAGE_NAME).arm.$$(date +%Y%m%d).tar.gz
