
NETHACK_SRC := https://github.com/NetHack/NetHack/archive/refs/tags/NetHack-3.6.7_Released.tar.gz

$(eval $(call DOWNLOAD_SOURCE,cli/nethack,$(NETHACK_SRC)))
$(eval $(call SPECIFY_DEPS,cli/nethack,lib/ncurses))

o/cli/nethack/configured.x86_64:\
	CONFIG_COMMAND = $(BASELOC)/cli/nethack/config-wrapper

o/cli/nethack/configured.aarch64:\
	CONFIG_COMMAND = $(BASELOC)/cli/nethack/config-wrapper

o/cli/nethack/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/cli/nethack/built.fat: \
	BINS = nethack usr/share/terminfo usr/share/nethack
