DOCKER_IMAGE=node
VERSIONS=8 13

include Makefile.docker

PACKAGE_VERSION=0.1

include Makefile.package

.PHONY: check-version
check-version:
	docker run --rm $(DOCKER_NAMESPACE)/$(DOCKER_IMAGE):$(VERSION) node --version

deb:
	mkdir -p build/usr/sbin/
	cp -Rf bin/* build/usr/sbin/
	cp bin/node build/usr/sbin/npm
	$(foreach version,$(DEBVERSIONS), cp bin/node build/usr/sbin/node$(version);)
	$(foreach version,$(DEBVERSIONS), cp bin/node build/usr/sbin/npm$(version);)

run:
	./bin/$(DOCKER_IMAGE) --version

install:
	install bin/ansible $(prefix)/bin/ansible
	ln -sfn $(prefix)/bin/ansible $(prefix)/bin/npm
