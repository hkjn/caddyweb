#
# Caddy web server for hkjn.me.
#
FROM alpine

MAINTAINER Henrik Jonsson <me@hkjn.me>

ENV USER web
ENV HOME /home/$USER
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Install useful programs.
RUN apk --no-cache add bash vim git go && \
    adduser -D $USER -s /bin/bash && \
    go get github.com/mholt/caddy hkjn.me/caddyweb

WORKDIR $GOPATH/src/hkjn.me/caddyweb

USER $USER

ENTRYPOINT ["caddy"]
