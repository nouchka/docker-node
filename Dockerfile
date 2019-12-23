ARG  VERSION=13
FROM node:${VERSION}
LABEL maintainer="Jean-Avit Promis docker@katagena.com"

LABEL org.label-schema.vcs-url="https://github.com/nouchka/docker-node"
LABEL version="latest"
ARG DOCKER_TAG=latest
