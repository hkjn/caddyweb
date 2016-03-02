#
# Caddy web server for hkjn.me.
#
FROM alpine

MAINTAINER Henrik Jonsson <me@hkjn.me>

ENV USER web
ENV HOME /home/$USER
ENV GOPATH $HOME
ENV PATH /usr/bin:/usr/sbin:/sbin:$GOPATH/bin

RUN apk --no-cache add bash vim git go && \
    adduser -D $USER -s /bin/bash && \
    go get github.com/mholt/caddy

COPY Caddyfile $GOPATH/src/hkjn.me/caddyweb/

WORKDIR $GOPATH/src/hkjn.me/caddyweb

USER $USER

ENTRYPOINT ["caddy"]
