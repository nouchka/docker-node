DOCKER_IMAGE=node
VERSIONS=8 13

include Makefile.docker

PACKAGE_VERSION=0.1
DEBVERSIONS=8 13
DUPLICATE_BIN_NAME=npm

include Makefile.package

.PHONY: check-version
check-version:
	docker run --rm $(DOCKER_NAMESPACE)/$(DOCKER_IMAGE):$(VERSION) node --version

deb:
	mkdir -p build/usr/sbin/
	$(foreach bin,$(DUPLICATE_BIN_NAME), cp bin/$(DOCKER_IMAGE) bin/$(bin);)
	cp -Rf bin/* build/usr/sbin/
	$(foreach version,$(DEBVERSIONS), for file in bin/* ; do cp $$file build/usr/s$$file\$(version) ; done;)

run:
	./bin/$(DOCKER_IMAGE) --version

install:
	install bin/ansible $(prefix)/bin/ansible
	ln -sfn $(prefix)/bin/ansible $(prefix)/bin/npm
