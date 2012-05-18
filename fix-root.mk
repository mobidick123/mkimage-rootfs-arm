FIX_ROOT ?= $(MKI_TOOLSDIR_LOCAL)/mki-fix-root

fix-root: prepare-workdir copy-subdirs $(SUBDIRS)
	@echo "mkimage: Processing '$@' ..."
	@$(CHECK_OBSOLETE) $@; \
	$(FIX_ROOT) || exit 1

