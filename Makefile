ifeq ($(PREFIX),)
	PREFIX := /usr/local
endif

all:
	cd vindicator && $(MAKE) PREFIX=$(DESTDIR)$(PREFIX) UPDATE_ICON=../draw.vala

clean:
	cd vindicator
	make clean

install: vindicator
	install -d $(DESTDIR)$(PREFIX)/bin/
	install -m 755 get_iw_signal $(DESTDIR)$(PREFIX)/bin/
	install -m 755 wifistart.sh $(DESTDIR)$(PREFIX)/bin
	install -m 755 indicator.service $(DESTDIR)/usr/lib/systemd/user
	cd vindicator && $(MAKE) PREFIX=$(PREFIX) install

uninstall:
	rm $(PREFIX)/bin/get_iw_signal
	rm $(PREFIX)/bin/vindicator	
	rm $(PREFIX)/bin/wifistart.sh
	rm /usr/lib/systemd/user/indicator.service
