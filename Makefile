# by LucasLelievre based on externsion-list's makefile

SRC_DIR = volume_scroller@francislavoie.github.io

UUID = $(shell cat $(SRC_DIR)/metadata.json | grep uuid | sed -e 's/.* "//; s/",//')
INSTALLED = $(shell gnome-extensions list | grep $(UUID))
EXTDIR = $(HOME)/.local/share/gnome-shell/extensions/$(UUID)
ZIP = $(UUID).shell-extension.zip

BUILD = build

clean:
	$(info Cleaning)
	rm -rf $(BUILD)
	rm -f *.zip

$(BUILD):
	$(info Building)
	mkdir -p $(BUILD)
	cp -r $(SRC_DIR)/* $(BUILD)

install: $(BUILD)
ifneq ($(strip $(INSTALLED)),)
	$(info Uninstalling the current extension)
	gnome-extensions uninstall $(UUID)
endif
	@if [ -d "$(EXTDIR)" ]; then \
		echo "rm -rf $(EXTDIR)"; \
		rm -rf $(EXTDIR); \
	fi
	$(info Pack the extension)
	gnome-extensions pack $(BUILD) --force
	$(info Install the extension)
	gnome-extensions install $(ZIP)

debug: install
	$(info Start the nested debug session (for wayland))
	dbus-run-session -- gnome-shell --nested --wayland
