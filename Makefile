ifeq ($(PREFIX),)
	PREFIX := /usr/local
endif
ifeq ($(XDG_DEST),)
	XDG_DEST := /etc/xdg/autostart
endif

help:
	@echo "make all for compiling vindicator and draw.vala"
	@echo "make install for installing wifiman-indicator"
	@echo "make uninstall for uninstalling wifiman-indicator"
	@echo "make clean for cleaning vindicator folder"

all:
	cd vindicator && $(MAKE) PREFIX=$(PREFIX) UPDATE_ICON=../draw.vala

clean:
	cd vindicator
	make clean

install: vindicator
	install -d $(PREFIX)/bin/
	install -m 755 get_iw_signal $(PREFIX)/bin/
	install -m 755 wifistart.sh $(PREFIX)/bin
	install -d $(XDG_DEST)
	install -m 755 indicator.desktop $(XDG_DEST)
	cd vindicator && $(MAKE) PREFIX=$(PREFIX) install

uninstall:
	rm $(PREFIX)/bin/get_iw_signal
	rm $(PREFIX)/bin/vindicator	
	rm $(PREFIX)/bin/wifistart.sh
	rm $(XDG_DEST)/indicator.service
