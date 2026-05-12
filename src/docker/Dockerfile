FROM nixos/nix:latest
MAINTAINER Robin Hack <hack.robin@gmail.com>

WORKDIR /build

RUN ./graybuild.sh
ENTRYPOINT ["/bin/sh", "-i"]
