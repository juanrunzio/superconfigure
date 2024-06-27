HTOP_SRC := https://github.com/htop-dev/htop/archive/refs/tags/3.3.0.tar.gz
HTOP_DEPS := lib/ncurses

$(eval $(call DOWNLOAD_SOURCE,cli/htop,$(HTOP_SRC)))
$(eval $(call SPECIFY_DEPS,cli/htop,$(HTOP_DEPS)))

o/cli/htop/patched: o/cli/htop/source
    cd $(BASELOC)/o/cli/htop/htop* && patch -p1 < $(BASELOC)/patches/fix-scheduling.patch
    touch $@

o/cli/htop/setup: o/cli/htop/patched
    cd $(BASELOC)/o/cli/htop/htop* && ./autogen.sh
    touch $@

o/cli/htop/configured.x86_64: o/cli/htop/setup
o/cli/htop/configured.aarch64: o/cli/htop/setup

o/cli/htop/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/cli/htop/config-wrapper
o/cli/htop/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/cli/htop/config-wrapper

o/cli/htop/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/cli/htop/built.fat: BINS = htop
