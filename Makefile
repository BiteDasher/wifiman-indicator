ifeq ($(PREFIX),)
	PREFIX := /usr/local
endif
ifeq ($(SYSTEMD_DEST),)
	SYSTEMD_DEST := /usr/lib/systemd/user
endif

help:
	@echo "make all for installing vindicator and draw.vala"
	@echo "make install for installing wifiman"
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
	install -d $(SYSTEMD_DEST)
	install -m 755 indicator.service $(SYSTEMD_DEST)
	cd vindicator && $(MAKE) PREFIX=$(PREFIX) install

uninstall:
	rm $(PREFIX)/bin/get_iw_signal
	rm $(PREFIX)/bin/vindicator	
	rm $(PREFIX)/bin/wifistart.sh
	rm $(SYSTEMD_DEST)/indicator.service
