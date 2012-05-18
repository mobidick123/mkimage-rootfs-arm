BATCH_INSTALL ?= $(MKI_TOOLSDIR_LOCAL)/mki-batch-install

batch-install: prepare-workdir copy-subdirs $(SUBDIRS)
	@echo "mkimage: Processing '$@' ..."
	@$(CHECK_OBSOLETE) $@; \
	if ! [ -f $(WORKDIR)/chroot/.out/file-list-pre ]; then \
		$(BATCH_INSTALL) "$(INSTALL_FEATURES)" "$(INSTALLER_AUX)" || exit 1; \
	fi
