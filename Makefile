PACKAGE=kittyhao
VERSION=1.0.1
BUILD=build

PREFIX=usr
DESTDIR=$(BUILD)

all: deb

deb:
	rm -rf $(BUILD)

	mkdir -p $(BUILD)/DEBIAN
	mkdir -p $(BUILD)/$(PREFIX)/bin
	mkdir -p $(BUILD)/$(PREFIX)/lib/kittyhao

	cp debian/control $(BUILD)/DEBIAN/control
	cp debian/postinst $(BUILD)/DEBIAN/postinst

	cp kittyhao $(BUILD)/$(PREFIX)/bin/kittyhao
	cp -r core themes config $(BUILD)/$(PREFIX)/lib/kittyhao/

	chmod 755 $(BUILD)/$(PREFIX)/bin/kittyhao
	chmod 755 $(BUILD)/DEBIAN/postinst

	dpkg-deb --build $(BUILD) $(PACKAGE)_$(VERSION)_all.deb

clean:
	rm -rf $(BUILD)
	rm -f *.deb
