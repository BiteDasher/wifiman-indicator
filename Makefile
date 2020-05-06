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
	cd vindicator && $(MAKE) PREFIX=$(PREFIX) install

uninstall:
	rm $(PREFIX)/bin/get_iw_signal
	rm $(PREFIX)/bin/vindicator	

