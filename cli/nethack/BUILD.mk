
NETHACK_SRC := https://www.nethack.org/download/3.6.7/nethack-367-src.tgz
NETHACK_DEPS := lib/ncurses

$(eval $(call DOWNLOAD_SOURCE,cli/nethack,$(NETHACK_SRC)))
$(eval $(call SPECIFY_DEPS,cli/nethack,$(NETHACK_DEPS)))

o/cli/nethack/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/cli/nethack/config-wrapper
o/cli/nethack/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/cli/nethack/config-wrapper

o/cli/nethack/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/cli/nethack/built.fat: BINS = nethack usr/share/terminfo
