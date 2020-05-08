ifeq ($(PREFIX),)
	PREFIX := /usr/local
endif
ifeq ($(XDG_DEST),)
	XDG_DEST := /etc/xdg/autostart
endif
ifeq ($(PK_DEST),)
	PK_DEST := /usr/share/polkit-1/actions
endif
ifeq ($(PK_EXEC_DEST),)
	PK_EXEC_DEST := \/usr\/local\/bin
endif

help:
	@echo "make all for compiling vindicator and draw.vala"
	@echo "make install for installing wifiman-indicator"
	@echo "make uninstall for uninstalling wifiman-indicator"
	@echo "make clean for cleaning vindicator folder"

all:
	git submodule update --init --recursive
	cd vindicator && $(MAKE) PREFIX=$(PREFIX) UPDATE_ICON=../draw.vala

clean:
	cd vindicator
	make clean

install: vindicator
	install -d $(PREFIX)/bin/
	install -m 755 get_iw_signal $(PREFIX)/bin/
	install -m 755 wmindtoggle $(PREFIX)/bin
	install -d $(XDG_DEST)
	install -m 644 indicator.desktop $(XDG_DEST)
	cd vindicator && $(MAKE) PREFIX=$(PREFIX) UPDATE_ICON=../draw.vala install
	install -d $(PK_DEST)
	install -m 644 org.bitedasher.wifigui.policy $(PK_DEST)
	sed "s/\#\#\#\#\#/$(PK_EXEC_DEST)\/wifigui/g" -i $(PK_DEST)/org.bitedasher.wifigui.policy

uninstall:
	rm $(PREFIX)/bin/get_iw_signal
	rm $(PREFIX)/bin/vindicator	
	rm $(PREFIX)/bin/wmindtoggle
	rm $(XDG_DEST)/indicator.desktop
