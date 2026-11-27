PACKAGE=kittyhao
VERSION=1.0.0
BUILD=build

all: deb

deb:
	mkdir -p $(BUILD)/DEBIAN
	mkdir -p $(BUILD)/usr/bin
	mkdir -p $(BUILD)/usr/share/kittyhao

	cp debian/control $(BUILD)/DEBIAN/control
	cp debian/postinst $(BUILD)/DEBIAN/postinst
	cp debian/prerm $(BUILD)/DEBIAN/prerm

	cp kittyhao $(BUILD)/usr/bin/kittyhao
	cp -r core themes config $(BUILD)/usr/share/kittyhao/

	chmod 755 $(BUILD)/usr/bin/kittyhao
	chmod 755 $(BUILD)/DEBIAN/postinst
	chmod 755 $(BUILD)/DEBIAN/prerm

	dpkg-deb --build $(BUILD) $(PACKAGE)_$(VERSION)_all.deb

clean:
	rm -rf $(BUILD)
	rm -f *.deb

install:
	sudo dpkg -i $(PACKAGE)_$(VERSION)_all.deb
